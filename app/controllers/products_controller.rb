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
    if CartItem.exists?(product: @product, cart: @cart, price: @product.price)
      c = CartItem.where(product: @product, cart: @cart, price: @product.price)[0]
      c.update(quantity: c.quantity += 1)
    else
      CartItem.create(product: @product, cart: @cart, price: @product.price, quantity: 1)
    end
    redirect_to cart_path, cart_add: "#{c.id} created!"
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :stock, :made_to_order?, :available, :photo)
  end


end
