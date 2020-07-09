class Admins::OrdersController < ApplicationController
  def index
  	@orders = Order.all
  end

  def show
  	@order = Order.find(params[:id])
  	@order_item = @order.order_items
  end

   def update_order
   	@order = Order.find(params[:id])
   	@order.order_status.update(update_params)
   	redirect_to admins_order_path
   end

	   private 
	   def update_params
	   	params.require(:order).permit(:order_status)
	   end
end
