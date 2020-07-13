class Admins::OrderItemsController < ApplicationController
	before_action :authenticate_admin!

	def update_make
		@order = OrderItem.find(params[:id])
		@order_item = @order.order
		if update_params[:make_status] == '製作中'
			@order.update(update_params)
			@order_item.update(order_status: "製作中")
		elsif update_params[:make_status] == '製作完了'
			@order.update(update_params)
			@order_item.update(order_status: "発送準備中")
		end
		redirect_to admins_order_path(@order.order)
	end

	   private
	   def update_params
	   	params.require(:order_item).permit(:make_status)
	   end
end
