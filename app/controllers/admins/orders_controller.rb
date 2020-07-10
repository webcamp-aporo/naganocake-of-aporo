class Admins::OrdersController < ApplicationController
  def index
  	@orders = Order.all
  end

  def show
  	@order = Order.find(params[:id])
  	@order_items = @order.order_items
  end

   def update_order
   	@order = Order.find(params[:id])
   	@order.update(order_params)
   	redirect_to admins_order_path
   end

	   private 
	   def order_params
	   	params.require(:order).permit(:order_status)
	   end
end
