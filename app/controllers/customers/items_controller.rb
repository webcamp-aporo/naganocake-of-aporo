class Customers::ItemsController < ApplicationController
	def index
		@items = Item.all
		@genres = ItemGenre.all
	end

	def show
	    @item = Item.find(params[:id])
	    @genres = ItemGenre.all
	end

	def genres
		@items = Item.where(item_genre_id: params[:id])			#記述が正しいか不安。params不要かもしれん。
		@genres = ItemGenre.all
	end

  private
    def item_params
      params.require(:item).permit(:image, :name, :description, :item_genre_id, :price, :is_active)
    end
end
end
