class Admins::ItemsController < ApplicationController

  def index
    @items = Item.page(params[:page]).per(10)
  end

  def new
    @item = Item.new
    @item_genres = ItemGenre.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admins_item_path(@item), notice: "商品を登録しました"
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    @tax = @item.price * 1.1
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admins_item_path(@item), notice: "商品を更新しました"
    else
      render :edit
    end
  end


  private
    def item_params
      params.require(:item).permit(:image, :name, :description, :item_genre_id, :price, :is_active)
    end
end
