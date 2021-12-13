class ProductsController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @order = Order.new
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
    if CartItem.exists?(product: @product, cart: @cart, price: @product.price)
      c = CartItem.where(product: @product, cart: @cart, price: @product.price)[0]
      c.update(quantity: c.quantity += 1)
    else
      c = CartItem.create(product: @product, cart: @cart, price: @product.price, quantity: 1)
    end
    redirect_to cart_path, cart_add: "#{c.id} created!"
  end

  def buy_directly
    @product = Product.find(params[:product_id])
    @order = Order.new()
    if user_signed_in?
      @order.update(user: current_user)
    else
      @order.update(customer_session_id: session[:session_id])
    end
    oi = OrderItem.new
    oi.order = @order
    oi.product = @product
    oi.price = @product.price
    oi.quantity = 1
    oi.save!
    @order.price = @product.price
    @order.save!
    if @order.save
      redirect_to order_path(@order)
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :stock, :made_to_order?, :available, :photo)
  end


end
