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
    @order.amount = 0

    @cart.cart_items.each do |c|
      order_item = OrderItem.new
      order_item.order = @order
      order_item.product = c.product
      order_item.amount = order_item.product.price
      order_item.save!
      @order.update(amount: @order.amount += order_item.amount)
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
