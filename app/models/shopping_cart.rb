class ShoppingCart < ApplicationRecord
  has_many :products, dependent: :destroy
end
