class Customers::HomesController < ApplicationController
  def top
  	@genres = ItemGenre.all
  	@items = Item.page(params[:page]).per(4)
  end
end
