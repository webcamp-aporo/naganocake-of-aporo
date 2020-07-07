class Customers::OrdersController < ApplicationController
	def index
		
	end

	def show
		
	end

	def new
		
	end

	def confirm_new
		@order_items = current_customer.cart_items
	end

	def finish
	end

end
