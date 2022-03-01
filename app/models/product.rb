class Product < ApplicationRecord
	has_one_attached :cover_photo
	monetize :price_cents
end
