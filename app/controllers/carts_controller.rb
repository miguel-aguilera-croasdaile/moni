class CartsController < ApplicationController
  before_action :set_cart

  def show
    @order = Order.new
    @total = 0
    @cart.cart_items.each do |ci|
      @total += ci.quantity * ci.price
    end
  end

  def add_to_cart
    @product = Product.find(params[:product_id])
    if CartItem.exists?(product: @product, cart: @cart, price: @product.price)
      c = CartItem.where(product: @product, cart: @cart, price: @product.price)[0]
      c.update(quantity: c.quantity += 1)
    else
      c = CartItem.create(product: @product, cart: @cart, price: @product.price, quantity: 1)
    end
    redirect_to cart_path, cart_add: "#{c.id} created!"
  end

  private

end
