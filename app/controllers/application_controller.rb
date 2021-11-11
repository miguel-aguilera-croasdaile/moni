class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_cart
  before_action :store_user_location!, if: :storable_location?

  include Pundit

  private

  def set_cart
    @cart = current_user.cart if current_user
  end

  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
  end

  def store_user_location!
    store_location_for(:user, request.fullpath)
  end

end
