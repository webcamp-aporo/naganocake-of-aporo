class Customers::CustomersController < ApplicationController
  before_action :authenticate_customer!
  
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customer_path(current_customer.id), notice: "登録情報を編集しました"
    else
      render :edit
    end
  end

  def exit
    @customer = current_customer
  end

  def destroy
    @customer = current_customer
    @customer.destroy
    redirect_to root_path, notice: "退会しました"
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_number, :address, :phone_number)
  end

end
