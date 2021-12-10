class OrdersController < ApplicationController

  def show
    if user_signed_in?
      @order = current_user.orders.find(params[:id])
    else
      @order = Order.where(customer_session_id: session[:session_id])[0]
    end
  end

  def index
    if user_signed_in?
      @orders = Order.where(user: current_user)
    else
      @orders = Order.where(customer_session_id: session[:session_id])
    end
  end

  def create
    @order = Order.create()
    if user_signed_in?
      @order.update(user: current_user)
    else
      @order.update(customer_session_id: session[:session_id])
    end
    @order.save!
    @order.price = 0
    @cart.cart_items.each do |c|
      order_item = OrderItem.new
      order_item.order = @order
      order_item.product = c.product
      order_item.price = c.price
      order_item.save!
      @order.update(price: @order.price += order_item.price)
    end
    @order.save!
    if @order.save
      @cart.clear
    else
      raise
    end
    redirect_to order_path(@order)
  end

end
