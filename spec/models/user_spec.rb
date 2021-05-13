require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる時' do
      it 'nicknameとemail、passwordとpassword_confirmation、last_nameとfirst_name、last_name_katakanaとfirst_name_katakana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'emailに@が存在したら登録できる' do
        @user.email = 'test@test'
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上かつ、半角英数字混合であれば登録できる' do
        @user.password = 'pas123'
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
      end
      it 'last_nameとfirst_nameが全角であれば登録できる' do
        @user.last_name = 'テスト'
        @user.first_name = '太朗'
        expect(@user).to be_valid
      end
      it 'last_name_katakanaとfirst_name_katakanaがカタカナであれば登録できる' do
        @user.last_name_katakana = 'テスト'
        @user.first_name_katakana = 'タロウ'
        expect(@user).to be_valid
      end
    end

    context '新規登録できない時' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@が含まれていない場合は登録できない' do
        @user.email = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordが存在してもpassword_confirmationと一致しないと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'pas00'
        @user.password_confirmation = 'pas00'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが半角数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが半角英語のみでは登録できない' do
        @user.password = 'aaabbb'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが全角英数混合では登録できない' do
        @user.password = '123abｃ'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'last_nameが空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it 'last_nameが全角以外だと登録できない' do
        @user.last_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name is invalid'
      end
      it 'first_nameが空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'first_nameが全角以外だと登録できない' do
        @user.first_name = '111'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name is invalid'
      end
      it 'last_name_katakanaが空だと登録できない' do
        @user.last_name_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name katakana can't be blank"
      end
      it 'last_name_katakanaがカタカナ以外だと登録できない' do
        @user.last_name_katakana = '太朗'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name katakana is invalid'
      end
      it 'first_name_katakanaが空だと登録できない' do
        @user.first_name_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name katakana can't be blank"
      end
      it 'first_name_katakanaがカタカナ以外だと登録できない' do
        @user.first_name_katakana = '太朗'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name katakana is invalid'
      end

      it 'birthdayが空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
  end
end
