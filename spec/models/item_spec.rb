require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の保存' do
    context '商品が出品できる場合' do
      it 'image、item_name、description、category_id、status_id、burden_id、area_id、day_id、priceが存在すれば出品できる' do
        expect(@item).to be_valid
      end
      it 'category_idが1以外であれば出品できる' do
        @item.category_id = 2
        expect(@item).to be_valid
      end
      it 'status_idが1以外であれば出品できる' do
        @item.status_id = 2
        expect(@item).to be_valid
      end
      it 'burden_idが1以外であれば出品できる' do
        @item.status_id = 2
        expect(@item).to be_valid
      end
      it 'area_idが1以外であれば出品できる' do
        @item.area_id = 2
        expect(@item).to be_valid
      end
      it 'day_idが1以外であれば出品できる' do
        @item.day_id = 2
        expect(@item).to be_valid
      end
      it 'priceが300以上9999999以下であれば出品できる' do
        @item.price = 300
        expect(@item).to be_valid
      end
    end
    context '商品が出品できない場合' do
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'item_nameが空では出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'descriptionが空では出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが1では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it 'status_idが1では出品できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end
      it 'burden_idが1では出品できない' do
        @item.burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden must be other than 1")
      end
      it 'area_idが1では出品できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Area must be other than 1")
      end
      it 'day_idが1では出品できない' do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Day must be other than 1")
      end
      it 'priceが299以下では出品できない' do
        @item.price = 10
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 299")
      end
      it 'priceが10000000以下では出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 10000000")
      end
      it 'priceが全角文字では出品できない' do
        @item.price = 'あああ'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが半角英数混合では出品できない' do
        @item.price = "#{10}aaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが半角英語では出品できない' do
        @item.price = 'aaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
