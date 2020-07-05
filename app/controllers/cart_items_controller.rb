class CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
    # カートの合計金額
    @totla_price = @cart_items.sum{|c| c.item.price * c.count }
  end

  def create
    @cart_item = current_customer.cart_items.build(cart_item_params)
    if @cart_item.save
      redirect_to cart_items_path
    else
      render "items/show"
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