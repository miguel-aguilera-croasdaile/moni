class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  before_action :set_cart
  before_action :store_user_location!, if: :storable_location?

  # add_flash_types :cart_add

  include Pundit

  private

  def set_cart
    if user_signed_in?
      @cart = current_user.cart
    else
      if Cart.exists?(id: session[:cart_id])
        @cart = Cart.find(session[:cart_id])
      else
        cart = Cart.new()
        cart.save!
        session[:cart_id] = cart.id
      end
    end
  end

  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
  end

  def store_user_location!
    store_location_for(:user, request.fullpath)
  end

end
