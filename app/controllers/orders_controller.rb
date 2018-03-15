class OrdersController < ApplicationController

  def new
    @order = Order.new

    # add_items_from_cart is defined on the order model
    # we place the order items into the order
    @order.add_items_from_cart(@current_cart)
  end

  def create
    @order = Order.new(form_params)
    @order.add_items_from_cart(@current_cart)

    if @order.save_and_charge
      # After order has been completed, we reset the cart for the customers
      reset_session

      flash[:success] = "Order completed!"

      # We redirect the customer to the thanks page
      redirect_to order_path(@order)
    else
      render "new"
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def form_params
    params.require(:order).permit(:first_name, :last_name, :email, :address_1, :address_2, :city, :country, :postal_code, :stripe_token)
  end
end
