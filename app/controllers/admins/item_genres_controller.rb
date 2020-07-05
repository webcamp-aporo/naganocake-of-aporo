class Admins::ItemGenresController < ApplicationController
  def index
    @item_genre = ItemGenre.new
    @item_genres = ItemGenre.all
  end
  
  def create
    @item_genre = ItemGenre.new(item_genre_params)
    if @item_genre.save
      # binding.pry
      redirect_to admins_item_genres_path, notice: 'ジャンルを登録しました'
    else
      @item_genres = ItemGenre.all
      render :index
    end
  end

  def edit
    @item_genre = ItemGenre.find(params[:id])
  end

  def update
    @item_genre = ItemGenre.find(params[:id])
    if @item_genre.update(item_genre_params)
      redirect_to admins_item_genres_path, notice: 'ジャンルを編集しました'
    else
      render :edit
    end
  end

  private
    def item_genre_params
      params.require(:item_genre).permit(:name,:is_delete)
    end
end
