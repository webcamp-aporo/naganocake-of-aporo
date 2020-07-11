class Admins::HomesController < ApplicationController
  before_action :authenticate_admin!
  
  def top
  	@orders = Order.where(created_at: Time.now.in_time_zone.all_day)
  end
end
