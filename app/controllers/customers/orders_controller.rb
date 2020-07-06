class Customers::OrdersController < ApplicationController
	def index
		
	end

	def show
		
	end

	def new
		
	end

	def confirm_new
		@orders = current_customer.orders.order_items
	end

	def finish
	end
end
