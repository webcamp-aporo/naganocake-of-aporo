class Customers::HomesController < ApplicationController
  def top
	Item.joins(:item_genre)
	@items = Item.joins(:item_genre).where('items.is_active == ?', 1).where('item_genres.is_delete == ?', 0).order(name: "ASC").page(params[:page]).per(4)
	@genres = ItemGenre.where(is_delete: false)
  end

  def about
  end
end
