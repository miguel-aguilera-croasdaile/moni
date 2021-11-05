class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  def remove_from_cart
    self.destroy
  end
end
