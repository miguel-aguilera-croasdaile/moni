class Cart < ApplicationRecord
  belongs_to :user, optional: true
  has_many :cart_items

  def clear
    self.cart_items.each{ |ci| ci.destroy}
  end

end
