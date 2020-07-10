class Customers::OrdersController < ApplicationController
	def index
		@orders = Order.where(customer_id: current_customer.id)
	end

	def show
		@order = Order.find(params[:id])
		@order_item = @order.order_items
		@total_item_price = @order_item.sum{|c| c.price * 1.1 * c.count }
	end

	def new
		@order = current_customer.orders.new
		@addresses = ShippingAddress.where(customer_id: current_customer)
	end

	def confirm_new
		@cart_items = current_customer.cart_items
		@total_item_price = @cart_items.sum{|c| c.item.price * c.count }
		@Tax = 1.1
		@Fee = 800
	end

	def create
		session[:order] = Order.new
		session[:order][:payment_methods] = params[:order][:payment_methods].to_i
		
		if params[:order][:selected_address] == "my address"
			session[:order][:postal_number] = current_customer.postal_number
			session[:order][:address] = current_customer.address
			session[:order][:name] = current_customer.last_name + current_customer.first_name
		elsif params[:order][:selected_address] == "shipping_address"
			addresses = ShippingAddress.find(params[:order][:shipping])
			session[:order][:postal_number] = addresses.postal_number
			session[:order][:address] = addresses.address
			session[:order][:name] = addresses.name
		elsif params[:order][:selected_address] == "new address"
			session[:order][:postal_number] = params[:order][:postal_number]
			session[:order][:address] = params[:order][:address]
			session[:order][:name] = params[:order][:name]
		end
		
		session[:order][:order_status] = 0
		cart_items = current_customer.cart_items
		sum = 0
		cart_items.each do |cart_item|
			sum += (cart_item.item.price * cart_item.count * 1.1).round
        end
        	session[:order][:payment] = sum + 800
        	session[:order][:shipping_fee] = 800
       		session[:order][:customer_id] = current_customer.id
		
		redirect_to confirm_new_order_path
	end

	def finish
		order = Order.new(session[:order])
		order.save
		cart_items = current_customer.cart_items
		cart_items.each do |cart_item|
			order_item = OrderItem.new
			order_item.item_id = cart_item.item.id
			order_item.order_id = order.id
			order_item.count = cart_item.count
			order_item.make_status = 0
			order_item.price = cart_item.item.price
		  	order_item.save
	    end
	    cart_items.destroy_all
	end

  private
    def orders
      params.require(:order).permit(:customer_id, :shipping_fee, :payment, :payment_methods, :postal_number, :address, :name, :order_status)
    end

end
