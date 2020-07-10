class Admins::OrdersController < ApplicationController
  def index
  	@orders = Order.page(params[:page]).per(10).order('created_at DESC')
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
