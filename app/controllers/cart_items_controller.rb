class CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
    # カートの合計金額
    @totla_price = @cart_items.sum{|c| c.item.price * c.count }
  end

  def create
    #引数の条件に該当するデータがあればそれを返し(find_by)、そうでなければ新しくインスタンス(new)を作成
    cart_item = current_customer.cart_items.find_or_initialize_by(item_id: cart_item_params[:item_id])
    #⭐︎新規登録かどうか
    if cart_item.new_record?
      #⭐︎true
      if cart_item.update_attributes(cart_item_params)
        redirect_to cart_items_path
      else
        flash[:danger] = "個数を選択してください"
        redirect_back(fallback_location: root_path)
      end
    else
      #⭐︎false
      item_count = cart_item.count + cart_item_params[:count].to_i
      if cart_item.update_attributes(count: item_count)
        redirect_to cart_items_path
      else
        redirect_back(fallback_location: root_path)
      end
    end
  end

  def update
    cart_item = CartItem.find(params[:id])
    if cart_item.update(cart_item_params)
      redirect_back(fallback_location: root_path)
    else
      render :index
    end
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_back(fallback_location: root_path)
  end

  def all_destroy
    cart_items = current_customer.cart_items
    cart_items.destroy_all
    redirect_back(fallback_location: root_path)
  end

  private
    def cart_item_params
      params.require(:cart_item).permit(:count, :item_id)
    end
end