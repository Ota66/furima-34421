require 'rails_helper'

RSpec.describe BuySipping, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @buy_sipping = FactoryBot.build(:buy_sipping, user_id: user.id, item_id: item.id)
    sleep(0.1)
  end

  describe '商品の購入' do
    context '商品が購入できる場合' do
      it 'すべての値が正しく入力されていれば購入できること' do
        expect(@buy_sipping).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @buy_sipping.building_name = ''
        expect(@buy_sipping).to be_valid
      end
    end
    context '商品が購入できない場合' do
      it 'user_idが空では購入できないこと' do
        @buy_sipping.user_id = ''
        @buy_sipping.valid?
        expect(@buy_sipping.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では購入できないこと' do
        @buy_sipping.item_id = ''
        @buy_sipping.valid?
        expect(@buy_sipping.errors.full_messages).to include("Item can't be blank")
      end
      it 'postal_codeが空では購入できないこと' do
        @buy_sipping.postal_code = ''
        @buy_sipping.valid?
        expect(@buy_sipping.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと購入できないこと' do
        @buy_sipping.postal_code = '1234567'
        @buy_sipping.valid?
        expect(@buy_sipping.errors.full_messages).to include("Postal code is invalid")
      end
      it 'area_idが1では購入できない' do
        @buy_sipping.area_id = 1
        @buy_sipping.valid?
        expect(@buy_sipping.errors.full_messages).to include("Area must be other than 1")
      end
      it 'municipalityが空では購入できない' do
        @buy_sipping.municipality = ""
        @buy_sipping.valid?
        expect(@buy_sipping.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'house_numberが空では購入できない' do
        @buy_sipping.house_number = ""
        @buy_sipping.valid?
        expect(@buy_sipping.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空では購入できない' do
        @buy_sipping.phone_number = ""
        @buy_sipping.valid?
        expect(@buy_sipping.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが11桁以内の数値のみでないと購入できない' do
        @buy_sipping.phone_number = '999123456789'
        @buy_sipping.valid?
        expect(@buy_sipping.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが半角数字のみでないと購入できない' do
        @buy_sipping.phone_number = 'aaaaaaaaaaa'
        @buy_sipping.valid?
        expect(@buy_sipping.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが全角数字だと購入できない' do
        @buy_sipping.phone_number = '９９９９９９９９９９９'
        @buy_sipping.valid?
        expect(@buy_sipping.errors.full_messages).to include("Phone number is invalid")
      end
      it 'クレジットカード情報が空では購入できない' do
        @buy_sipping.token = ""
        @buy_sipping.valid?
        expect(@buy_sipping.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end