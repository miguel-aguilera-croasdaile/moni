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

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :stock, :made_to_order?, :available, :cover_photo)
  end

end
