class Admins::OrderItemsController < ApplicationController

	def update_make
		@order = OrderItem.find(params[:id])
		@order.update(update_params)
		redirect_to admins_order_path(@order.order)
	end

	   private
	   def update_params
	   	params.require(:order_item).permit(:make_status)
	   end
end
