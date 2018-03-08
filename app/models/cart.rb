class Cart < ApplicationRecord
  has_many :order_items

  def totel_quantity
    @count = 0

    order_items.all.each do |item|
      @count = @count + item.quantity
    end

    @count # This is what we return at the end of the function
  end
end
