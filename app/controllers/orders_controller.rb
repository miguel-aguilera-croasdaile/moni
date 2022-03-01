class OrdersController < ApplicationController

  def show
    if user_signed_in?
      @order = current_user.orders.find(params[:id])
    else
      @order = Order.where(customer_session_id: session[:session_id]).find(params[:id])
    end
  end

  def index
    if user_signed_in?
      @orders = Order.where(user: current_user)
    else
      @orders = Order.where(customer_session_id: session[:session_id])
    end
  end

  def create

    @product = Product.find(params[:product_id])
    @order = Order.create!(amount: @product.price, status: 'pending', user: current_user)

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: @product.name,
        images: [@product.cover_photo.key],
        amount: @product.price_cents,
        currency: 'usd',
        quantity: 1
        }],
        success_url: order_url(@order),
        cancel_url: order_url(@order)
      );

    @order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:amount, :status, :user)
  end

end
