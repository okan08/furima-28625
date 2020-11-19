require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、lastnameとfirstname、furigana_lastとfurigana_first、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上であれば登録できる' do
        @user.password = 'a000000'
        @user.password_confirmation = 'a000000'
        expect(@user).to be_valid
      end
      it 'passwordが英数字混合であれば登録できる' do
        @user.password = 'a000000'
        @user.password_confirmation = 'a000000'
        expect(@user).to be_valid
      end
      it 'lastnameが全角で入力されていれば登録できる' do
        @user.lastname = '山田'
        expect(@user).to be_valid
      end
      it 'firstnameが全角で入力されていれば登録できる' do
        @user.firstname = '太郎'
        expect(@user).to be_valid
      end
      it 'furigana_lastが全角カタカナで入力されていれば登録できる' do
        @user.furigana_last = 'ヤマダ'
        expect(@user).to be_valid
      end
      it 'furigana_firstが全角カタカナで入力されていれば登録できる' do
        @user.furigana_first = 'タロウ'
        expect(@user).to be_valid
      end
      it '生年月日が入力されていれば登録できる' do
        @user.birthday = '2020-11-15'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくできないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが英数字混合でなければ登録できない' do
        @user.password = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password must be both letters and numbers')
      end
      it 'lastnameが空では登録できない' do
        @user.lastname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname can't be blank")
      end
      it 'firstnameが空では登録できない' do
        @user.firstname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname can't be blank")
      end
      it 'lastnameが全角で入力されていなければ登録できない' do
        @user.lastname = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Lastname must be Full-width')
      end
      it 'firstnameが全角で入力されていなければ登録できない' do
        @user.firstname = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname must be Full-width')
      end
      it 'furigana_lastが空では登録できない' do
        @user.furigana_last = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Furigana last can't be blank")
      end
      it 'furigana_firstが空では登録できない' do
        @user.furigana_first = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Furigana first can't be blank")
      end
      it 'furigana_lastが全角カタカナで入力されていなければ登録できない' do
        @user.furigana_last = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include('Furigana last must be Full-width katakana characters')
      end
      it 'furigana_firstが全角カタカナで入力されていなければ登録できない' do
        @user.furigana_first = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('Furigana first must be Full-width katakana characters')
      end
      it '生年月日が空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
