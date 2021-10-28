class ProductsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])

    if Order.exists?(product: @product, user: current_user)
      @order = Order.where(product: @product, user: current_user)[0]
    end
  end

end
