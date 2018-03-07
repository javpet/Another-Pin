class OrderItem < ApplicationRecord
  belongs_to :order, optional: true # Not every item will be an order
  belongs_to :cart, optional: true # Not every item will land in the cart
  belongs_to :product
end
