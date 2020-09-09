require 'rails_helper'

RSpec.describe UserPurchase, type: :model do
  describe UserPurchase do
    before do
      @user_purchase = FactoryBot.build(:user_purchase)
    end

    describe '商品が購入' do
      context '商品購入がうまくいかないとき' do
        it 'クレジットカード情報が空だと購入できないこと' do
          @user_purchase.token = nil
          @user_purchase.valid?
          expect(@user_purchase.errors.full_messages).to include "Token can't be blank"
        end

        it '郵便番号が空だと購入ができなこと' do
          @user_purchase.postal_code = nil
          @user_purchase.valid?
          expect(@user_purchase.errors.full_messages).to include "Postal code can't be blank"
        end

        it '郵便番号にハイフンが入っていないと購入ができないこと' do
          @user_purchase.postal_code = '1234567'
          @user_purchase.valid?
          expect(@user_purchase.errors.full_messages).to include 'Postal code is invalid'
        end

        it '配送先エリアが--だと購入できないこと' do
          @user_purchase.shipping_area_id
          @user_purchase.valid?
          expect(@user_purchase.errors.full_messages).to include 'Shipping area must be other than 1'
        end

        it '市区町村が空だと購入ができないこと' do
          @user_purchase.municipalities = nil
          @user_purchase.valid?
          expect(@user_purchase.errors.full_messages).to include "Municipalities can't be blank"
        end

        it '番地が空だと商品購入ができないこと' do
          @user_purchase.address_number = nil
          @user_purchase.valid?
          expect(@user_purchase.errors.full_messages).to include "Address number can't be blank"
        end

        it '電話番行が空だと商品購入ができないこと' do
          @user_purchase.phone_number = nil
          @user_purchase.valid?
          expect(@user_purchase.errors.full_messages).to include "Phone number can't be blank"
        end

        it '電話番号にハイフンがあると購入ができないこと' do
          @user_purchase.phone_number = '090-0000-0000'
          @user_purchase.valid?
          expect(@user_purchase.errors.full_messages).to include 'Phone number is invalid'
        end

        it '電話番号が11桁以内でなければ購入ができないこと' do
          @user_purchase.phone_number = '090000000000000'
          @user_purchase.valid?
          expect(@user_purchase.errors.full_messages).to include 'Phone number is invalid'
        end
      end
    end
  end
end
