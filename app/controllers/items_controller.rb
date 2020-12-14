class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :item_find, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.order('created_at DESC') # 全てのレコードを@itemsに代入、かつ新しい順に表示
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

  def show
  end

  def edit
    if current_user.id != @item.user_id
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user_id
      @item.destroy
    else
      redirect_to root_path
    end
  end

  def item_find
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :introduction, :price, :category_id, :condition_id, :deliverypay_id, :prefecture_id, :day_id).merge user_id: current_user.id
  end
end
