class ProductsController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
    authorize @product, :new?
  end

  def create
    @product = Product.new(product_params)
    authorize @product, :create?
    @product.save
    if @product.save
      redirect_to product_path(@product)
    else
      render product_new
    end
  end

  def add_to_cart
    @product = Product.find(params[:product_id])
    c = CartItem.create(product: @product, cart: @cart, price: @product.price, quantity: 1)
    redirect_to cart_path, cart_add: "#{c.id} created!"
  end

  def buy_directly
    @product = Product.find(params[:product_id])
    @order = Order.create(user: current_user)
    order_item = OrderItem.new(order: @order, product: @product, price: @product.price)
    order_item.save!
    @order.update(price: order_item.price)
    @order.save!

    redirect_to order_path(@order)

  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :stock, :made_to_order?, :available, :photo)
  end


end
