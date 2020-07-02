class Admins::CustomersController < ApplicationController
  def index
  	@customers = Customer.all
  end

  def show
  	@customer = Customer.find(params[:id])
  end

  def edit
  	@customer = Customer.find(params[:id])
  end

  def update
  	customer = Customer.find(params[:id])
  	customer.update(customer_params)
  	redirect_to customer_path(customer) #リダイレクト先は要確認
  end

  	# ストロングパラメーターは未定
  	# private
  	# def customer_params
  	# 	params.require(:customer).permit()
  	# end
end
