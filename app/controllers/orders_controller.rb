class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :item_find

  def index
    if user_signed_in? or item.order_id.nil?
      @address_order = AddressOrder.new
    else
      redirect_to root_path
    end
   
  end

  def create
    @address_order = AddressOrder.new(order_params)
    if @address_order.valid? 
      pay_item
      @address_order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

  private

  def order_params
    params.require(:address_order).permit(:postnum, :prefecture_id, :city, :housenum, :building, :tel).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_7cbf5672d0628231d99cf040"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
