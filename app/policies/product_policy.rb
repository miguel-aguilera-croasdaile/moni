class ProductPolicy < ApplicationPolicy

  attr_reader :user, :product

  def initialize(user, product)
    @user = user
    @product = product
  end

  def new?
    if @user
      return @user.admin
    end
  end

  def create?
    if @user
      return @user.admin
    end
  end
end
