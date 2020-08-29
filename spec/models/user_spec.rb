require 'rails_helper'

RSpec.describe User, type: :model do
  describe User do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録がうまくいかないとき' do
        it 'nicknameが空では登録ができないこと' do
          @user.nickname = nil
          @user.valid?
          expect(@user.errors.full_messages).to include "Nickname can't be blank"
        end

        it 'emailが空では登録ができないこと' do
          @user.email = nil
          @user.valid?
          expect(@user.errors.full_messages).to include "Email can't be blank"
        end

        it '重複したemailが存在する場合、登録ができないこと' do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end

        it 'passwordが空では登録ができないこと' do
          @user.password = nil
          @user.valid?
          expect(@user.errors.full_messages).to include "Password can't be blank"
        end

        it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
        end

        it 'passwordが5文字以下では登録ができないこと' do
          @user.password = '12345'
          @user.password_confirmation = '12345'
          @user.valid?
          expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
        end

        it 'first_nameが空では登録ができないこと' do
          @user.first_name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include "First name can't be blank"
        end

        it 'first_nameが全角(漢字、平仮名、カタカナ)でないと登録ができないこと' do
          @user.first_name = 'asdf123'
          @user.valid?
          expect(@user.errors.full_messages).to include 'First name is invalid'
        end

        it 'last_nameが空では登録ができないこと' do
          @user.last_name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include "Last name can't be blank"
        end

        it 'last_nameが全角(漢字、平仮名、カタカナ)でないと登録ができないこと' do
          @user.last_name = 'asd123'
          @user.valid?
          expect(@user.errors.full_messages).to include 'Last name is invalid'
        end

        it 'first_name_kanaが空では登録ができないこと' do
          @user.first_name_kana = nil
          @user.valid?
          expect(@user.errors.full_messages).to include "First name kana can't be blank"
        end

        it 'first_name_kanaが全角カタカナでなければ登録ができないこと' do
          @user.first_name_kana = '山12as'
          @user.valid?
          expect(@user.errors.full_messages).to include 'First name kana is invalid'
        end

        it 'last_name_kanaが空では登録ができないこと' do
          @user.last_name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include "Last name can't be blank"
        end

        it 'last_name_kanaが全角カタカナでなければ登録ができないこと' do
          @user.last_name_kana = '山12as'
          @user.valid?
          expect(@user.errors.full_messages).to include 'Last name kana is invalid'
        end

        it 'birth_dayが空では登録ができないこと' do
          @user.birth_day = nil
          @user.valid?
          expect(@user.errors.full_messages).to include "Birth day can't be blank"
        end
      end

      context '新規登録がうまくいくとき' do
        it 'nicknameがあれば登録ができること。' do
          @user.nickname = 'furima'
          expect(@user).to be_valid
        end

        it 'passwordが6文字以上であれば登録ができること' do
          @user.password = '123asd'
          @user.password_confirmation = '123asd'
          expect(@user).to be_valid
        end

        it 'first_nameが全角(漢字、平仮名、カタカナ)であれば登録ができること' do
          @user.first_name = '山ダあ'
          expect(@user).to be_valid
        end

        it 'last_nameが全角(漢字、平仮名、カタカナ)であれば登録ができること' do
          @user.last_name = '山ダあ'
          expect(@user).to be_valid
        end

        it 'first_name_kanaが全角カタカナであれば登録ができること' do
          @user.first_name_kana = 'カタカナ'
          expect(@user).to be_valid
        end

        it 'last_name_kanaが全角カタカナであれば登録ができること' do
          @user.last_name_kana = 'カタカナ'
          expect(@user).to be_valid
        end
      end

      context 'ログインがうまくいかないとき' do
        it 'emailが空であるときログインができない' do
          @user.email = nil
          @user.valid?
          expect(@user.errors.full_messages).to include "Email can't be blank"
        end
        it 'passwordが空であるときログインができない' do
          @user.password = nil
          @user.valid?
          expect(@user.errors.full_messages).to include "Password can't be blank"
        end
      end
    end
  end
end
