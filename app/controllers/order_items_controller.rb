class OrderItemsController < ApplicationController

  def create
    #find the product
    @product = Product.find(params[:product_id])

    #what's the cart cart = @current_cart

    # Quantity comes from the form_data
    @quantity = form_params[:quantity]

    # Add the product to cart
    @current_cart.order_items.create(product: @product, quantity: @quantity)

    flash[:success] = "Thanks for adding to your cart!"

    redirect_to product_path(@product)
  end

  def update
    @product = Product.find(params[:product_id])
    flash[:success] = "Thanks for updating to your cart!"
    redirect_to product_path(@product)
  end

  def form_params
    params.require(:order_item).permit(:quantity)
  end
end
