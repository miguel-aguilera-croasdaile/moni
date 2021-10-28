class OrdersController < ApplicationController

  def show
    @order = current_user.orders.find(params[:id])
  end

  def create
    product = Product.find(params[:product_id])
    order  = Order.create!(product: product, amount: product.price, status: 'pending', user: current_user)
    redirect_to new_order_payment_path(order)
  end

end
