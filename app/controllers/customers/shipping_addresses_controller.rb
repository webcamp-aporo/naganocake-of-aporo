class Customers::ShippingAddressesController < ApplicationController

  def index
    @customer = current_customer
  	@shipping_address = ShippingAddress.new
    @shipping_addresses = ShippingAddress.all
  end

  def create
  	@shipping_address = ShippingAddress.new(shipping_address_params)
    @shipping_address.customer_id = current_customer.id
  	if @shipping_address.save
  	  redirect_to shipping_addresses_path, notice: '新しい配送先を登録しました'
  	else
  	  @shipping_addresses = ShippingAddress.all
  	  render :index
  	end
  end

  def edit
    @shipping_address = ShippingAddress.find(params[:id])
    customer = current_customer.id
  end

  def update
    @shipping_address = ShippingAddress.find(params[:id])
    customer = current_customer.id
    if @shipping_address.update(shipping_address_params)
      redirect_to shipping_addresses_path, notice: "登録情報を編集しました"
    else
      render :edit
    end
  end

  def destroy
    @customer = current_customer
    @shipping_address = ShippingAddress.find(params[:id])
    @shipping_address.destroy
    redirect_to shipping_addresses_path, notice: "配送先を削除しました"
  end

  private
  def shipping_address_params
  	params.require(:shipping_address).permit(:postal_number, :address, :name)
  end

end
