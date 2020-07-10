class Customers::HomesController < ApplicationController
  def top
	@genres = ItemGenre.where(is_delete: false)
  	@items = Item.page(params[:page]).per(4)
  end
end
