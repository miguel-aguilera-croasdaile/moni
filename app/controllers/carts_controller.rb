class CartsController < ApplicationController
  def show
    @order = Order.new
    @total = 0
    @cart.cart_items.each do |ci|
      @total += ci.quantity * ci.price
    end
  end
end
