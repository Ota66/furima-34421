require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、last_nameとfirst_name、katakana_last_nameとkatakana_first_name、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'nicknameが6文字以上であれば登録できる' do
        @user.nickname = 'aaaaaa'
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上の半角英数字であれば登録できる' do
        @user.password = 'aaaaa1'
        @user.password_confirmation = 'aaaaa1'
        expect(@user).to be_valid
      end
      it 'last_nameとfirst_nameが全角漢字、かなであれば登録できる' do
        @user.last_name = '田中'
        @user.first_name = '太郎'
        expect(@user).to be_valid
      end
      it 'katakana_last_nameとkatakana_first_nameが全角カナであれば登録できる' do
        @user.katakana_last_name = 'タナカ'
        @user.katakana_first_name = 'タロウ'
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank", "Password is invalid", "Password confirmation doesn't match Password")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is invalid")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name is invalid")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid")
      end
      it 'last_name、first_nameが全角漢字、かな以外では登録できない' do
        @user.last_name = 'タナカ'
        @user.first_name = 'タロウ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid", "First name is invalid")
      end
      it 'katakana_last_nameが空では登録できない' do
        @user.katakana_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Katakana last name can't be blank", "Katakana last name is invalid")
      end
      it 'katakana_first_nameが空では登録できない' do
        @user.katakana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Katakana first name can't be blank", "Katakana first name is invalid")
      end
      it 'katakana_last_name、katakana_first_nameが全角カナ以外では登録できない' do
        @user.katakana_last_name = 'tanaka'
        @user.katakana_first_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include("Katakana last name is invalid", "Katakana first name is invalid")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)", "Password is invalid")
      end
    end
  end
end
