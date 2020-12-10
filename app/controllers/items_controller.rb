class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.all.order("created_at DESC") # 全てのレコードを@itemsに代入、かつ新しい順に表示
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :introduction, :price, :category_id, :condition_id, :deliverypay_id, :prefecture_id, :day_id).merge user_id: current_user.id
  end
end
