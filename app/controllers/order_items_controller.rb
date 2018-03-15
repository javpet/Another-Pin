class OrderItemsController < ApplicationController

  def create
    #find the product
    # we are currently not in the product controller, so since the order_items are connected to the product, we can check the product_id
    @product = Product.find(params[:product_id])

    #what's the cart cart = @current_cart

    # Quantity comes from the form_data
    @quantity = form_params[:quantity]

    # Add the product to cart
    # Create equals with .new.save
    @current_cart.order_items.create(product: @product, quantity: @quantity)

    flash[:success] = "Thanks for adding to your cart!"

    redirect_to product_path(@product)
  end

  def update
    @product = Product.find(params[:product_id])
    @order_item = OrderItem.find(params[:id])

    # From the form_params we already got the change in quantity so based on that we can update it
    @order_item.update(form_params)

    flash[:success] = "Thanks for updating to your cart!"

    redirect_to product_path(@product)
  end

  def destroy
    @product = Product.find(params[:product_id])
    @order_item = OrderItem.find(params[:id])
    @order_item.delete

    flash[:success] = "Product removed from cart"

    redirect_to cart_path
  end

  def form_params
    params.require(:order_item).permit(:quantity)
  end
end
