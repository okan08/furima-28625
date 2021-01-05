class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :item_find

  def index
    if user_signed_in? 
      @address_order = AddressOrder.new
    else
      redirect_to root_path
    end

    if @item.order.present?
      redirect_to root_path
    end

    if current_user.id == @item.user_id
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

  


  private

  def order_params
    params.require(:address_order).permit(:postnum, :prefecture_id, :city, :housenum, :building, :tel).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 自身のPAY.JPテスト秘密鍵を環境変数として呼び出している
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: order_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def item_find
    @item = Item.find(params[:item_id])
  end
  
end
