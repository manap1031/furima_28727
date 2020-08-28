require 'rails_helper'

RSpec.describe User, type: :model do
  describe User do
    before do
      @user = FactoryBot.build(:user)
    end
  

    describe 'ユーザー新規登録' do
      context '新規登録がうまくいくとき' do

        it "nickname,email,password,password_confirmation,first_name,last_name,first_name_kana,last_name_kana,birth_dayが存在すれば登録ができること" do
          expect(@user).to be_valid
        end

        it "passwordが６文字以上であれば登録ができること" do
          
        end

        it "first_nameが全角(漢字、平仮名、カタカナ)であれば登録ができること" do
          
        end

        it "last_nameが全角(漢字、平仮名、カタカナ)であれば登録ができること" do
          
        end

        it "first_name_kanaが全角カタカナであれば登録ができること" do
          
        end

        it "last_name_kanaが全角カタカナであれば登録ができること" do
          
        end

      end
    



      context '新規登録がうまくいかないとき' do
        it "nicknameが空では登録ができないこと" do
        end

        it "emailが空では登録ができないこと" do
        end

        it "重複したemailが存在する場合、登録ができないこと" do
          
        end

        it "passwordが空では登録ができないこと" do
        end

        it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
        end

        it "passwordが5文字以下では登録ができないこと" do
          
        end

        it "first_nameが空では登録ができないこと" do
        end      

        it "first_nameが全角(漢字、平仮名、カタカナ)でないと登録ができないこと" do
          
        end

        it "last_nameが空では登録ができないこと" do
          
        end      

        it "last_nameが全角(漢字、平仮名、カタカナ)でないと登録ができないこと" do
          
        end

        it "first_name_kanaが空では登録ができないこと" do
          
        end

        

        it "first_name_kanaが全角カタカナでなければ登録ができないこと" do
          
        end

        it "last_name_kanaが空では登録ができないこと" do
          
        end

        

        it "last_name_kanaが全角カタカナでなければ登録ができないこと" do
          
        end

        it "birth_dayが空では登録ができないこと" do
          
        end
      end

      context 'ログインがうまくいくとき' do
        it "emailとpasswordが存在していれば、ログインができる" do
          
        end
      end

      context 'ログインがうまくいくとき' do
        it "emailが空であるときログインができない" do
          
        end
        it "passwordが空であるときログインができない" do
          
        end          
      
      end



    end
  end
end
