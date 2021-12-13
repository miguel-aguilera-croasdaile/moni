class PaymentsController < ApplicationController
  def new
    if user_signed_in?
      @order = current_user.orders.find(params[:id])
    else
      @order = Order.where(customer_session_id: session[:session_id]).find(params[:order_id])
    end
    @total = 0
    @order.order_items.each do |ci|
      @total += ci.quantity * ci.price
    end
  end
end
