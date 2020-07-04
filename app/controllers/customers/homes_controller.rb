class Customers::HomesController < ApplicationController
  def top
  	# @genres = ItemGenres.all
  	@items = Item.all
  end
end
