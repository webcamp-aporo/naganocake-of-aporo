class Customers::ShippingAddressesController < ApplicationController

  def index
    @customer = current_customer
  	@shipping_address = ShippingAddress.new
  	@shipping_address = ShippingAddress.all
  end

  def create
  	@shipping_address = ShippingAddress.new
  	if @shipping_address.save
  	  redirect_to shipping_addresses_path, notice: '新しい配送先を登録しました'
  	else
  	  @shipping_addresses = ShippingAddress.all
  	  render :index
  	end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def shipping_address_params
  	params.require(:shipping_address).permit(:postal_number, :address, :name)
  end

end
