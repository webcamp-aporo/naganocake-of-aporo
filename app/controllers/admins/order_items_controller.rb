class Admins::OrderItemsController < ApplicationController
	def update_make
		@order = OrderItem.find(order_id:params[:id])
		@order.make_status.update(update_params)
		redirect_to admins_order_path
	end

	   private 
	   def update_params
	   	params.require(:order).permit(:make_status)
	   end
end
