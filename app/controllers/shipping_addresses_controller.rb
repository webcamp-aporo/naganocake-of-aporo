class ShippingAddressesController < ApplicationController
  def index
  	@customer = Customer.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
