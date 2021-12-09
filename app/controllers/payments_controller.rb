class PaymentsController < ApplicationController
  def new
    if user_signed_in?
      @order = current_user.orders.find(params[:id])
    else
      @order = Order.where(customer_session_id: session[:session_id])[0]
    end
  end
end
