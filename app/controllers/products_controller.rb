class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])

    # This only exists if we already added something to the basket
    @order_item = @current_cart.order_items.find_by(product: @product)

    # We need a backup if not
    if @order_item.nil?
      @order_item = @current_cart.order_items.new(product: @product, quantity: 1)
    end
  end
end
