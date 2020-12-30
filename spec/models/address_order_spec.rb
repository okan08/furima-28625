require 'rails_helper'

RSpec.describe AddressOrder, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @address_order = FactoryBot.build(:address_order, user_id: @user.id)
  end

  describe '商品購入' do
    context '商品購入ができる時' do
      it 'Userが存在すれば出品ができる' do
        expect(@user).to be_valid
      end
      it 'postnum, city, housenum, tel, prefecture_idが存在すれば購入できる' do
        expect(@address_order).to be_valid
      end
      it 'postnumにハイフンが含まれていれば購入できる' do
        @address_order.postnum = '123-4567'
        expect(@address_order).to be_valid
      end
      it 'prisceとtokenがあれば購入できる' do
        expect(@address_order).to be_valid
      end
    end

    context '商品が購入できない時' do
      it 'postnumが空では購入できない' do
        @address_order.postnum = ''
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Postnum can't be blank")
      end
      it 'cityが空では購入できない' do
        @address_order.city = ''
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("City can't be blank")
      end
      it 'housenumが空では購入できない' do
        @address_order.housenum = ''
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Housenum can't be blank")
      end
      it 'telが空では購入できない' do
        @address_order.tel = ''
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Tel can't be blank")
      end
      it 'prefecture_idが1では購入できない' do
        @address_order.prefecture_id = 1
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include('Prefecture Select')
      end
      it 'postnumにハイフンが含まれていなければ購入できない' do
        @address_order.postnum = '1234567'
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include('Postnum is invalid')
      end
      it 'tokenが空では購入できない' do
        @address_order.token = nil
        @address_order.valid?
        expect(@address_order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
