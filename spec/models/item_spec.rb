require 'rails_helper'

RSpec.describe Item, type: :model do
  describe Item do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test_image.png')
    end
    
    describe '商品出品ができないとき' do
      it '出品画像が空だと出品ができないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end

      it '商品名が空だと出品ができないこと' do
        @item.item_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end

      it '商品説明が空だと出品ができないこと' do
        @item.describe = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Describe can't be blank"
      end

      it 'カテゴリーが--だと出品ができないこと' do
        @item.category 
        @item.valid?
        expect(@item.errors.full_messages).to include "Category must be other than 1"
      end

       it '商品状態が--だと出品ができないこと' do
        @item.condition 
        @item.valid?
        expect(@item.errors.full_messages).to include "Category must be other than 1"
      end

      it '配送料の負担が--だと出品できないこと' do
        @item.shipping_charge 
        @item.valid?
        expect(@item.errors.full_messages).to include "Category must be other than 1"
      end

      it '発送エリアが--だと出品ができないこと' do
        @item.shipping_area 
        @item.valid?
        expect(@item.errors.full_messages).to include "Category must be other than 1"
      end

      it '発送までの日数が--だと出品できないこと' do
        @item.shipping_day 
        @item.valid?
        expect(@item.errors.full_messages).to include "Category must be other than 1"
      end

      it '販売価格が空だと出品できないこと' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end

      it '価格が300以下だと出品ができないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end

      it '価格が9999999以上だと出品ができないこと' do
        @item.price = 100000000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end

       it '販売価格は半角数字以外では出品できないこと' do
        @item.price = 'asdfg'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
       end

    end

    describe '商品出品できるとき' do
      it '商品が存在する場合出品ができること' do
        image_path = Rails.root.join('public/images/test_image.png')
      end 

    end
  end
end
