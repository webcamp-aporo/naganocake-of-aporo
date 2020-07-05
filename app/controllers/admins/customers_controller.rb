class Admins::CustomersController < ApplicationController
  def index
  	@customers = Customer.with_deleted
  end

  def show
  	@customer = Customer.with_deleted.find(params[:id])
  end

  def edit
  	@customer = Customer.with_deleted.find(params[:id])
  end

  def update
  	@customer = Customer.with_deleted.find(params[:id])
    if @customer.deleted_at.present? && params[:customer][:deleted_at] == "nill"
      @customer.restore
    elsif !@customer.deleted_at.present? && params[:customer][:deleted_at] == "true"
      @customer.destroy
    end
  	if @customer.update(customer_params)
   	   flash[:success] = "顧客情報を更新しました。"
 	   redirect_to admins_customer_path(@customer)
	 else
	   render 'edit'
	 end
  end

  	private
  	def customer_params
  		params.require(:customer).permit(:last_name,:first_name,
  								:last_name_kana,:first_name_kana,
  								:postal_number,:address,
  								:phone_number,:email)
  	end
end
