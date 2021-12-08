class OrdersController < ApplicationController

  def show
    @order = current_user.orders.find(params[:id])
  end

  def index
    @orders = Order.where(user: current_user)
  end

  def create
    @order = Order.create(user: current_user)
    @order.save!
    @order.price = 0

    @cart.cart_items.each do |c|
      order_item = OrderItem.new
      order_item.order = @order
      order_item.product = c.product
      order_item.price = c.price
      order_item.amount = c.amount
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
