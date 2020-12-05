require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @user = FactoryBot.build(:user)
  end

  describe '商品出品' do
    context '商品出品ができる時' do
      it 'Userが存在すれば出品ができる' do
        expect(@user).to be_valid
      end

      it 'name, introduction, price, user_id, category_id, condition_id, deliverypay_id, prefecture_id, day_idが存在すれば登録できる' do
        expect(@item).to be_valid
        #expect(@user).to be_valid
      end
      it 'priceが半角数字で入力されていれば出品できる' do
        @item.price = '9999'
        expect(@item).to be_valid
        #expect(@user).to be_valid
      end
      it 'priceが299〜10000000であれば出品できる' do
        @item.price = '9999'
        expect(@item).to be_valid
        #expect(@user).to be_valid
      end
    end

    context '商品出品ができない時' do
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end 
      it 'introductionが空では登録できない' do
        @item.introduction = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduction can't be blank")
      end 
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end 
      it 'priceが半角数字で入力されていなければ登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be half-width number")
      end 
      it 'priceが299〜10000000でなければ登録できない' do
        @item.price = '11'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of range")
      end
      it 'category_idが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end
      it 'condition_idが空では登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition Select")
      end 
      it 'deliverypay_idが空では登録できない' do
        @item.deliverypay_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Deliverypay Select")
      end 
      it 'prefecture_idが空では登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture Select")
      end 
      it 'day_idが空では登録できない' do
        @item.day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Day Select")
      end  
    end
  end 
end


