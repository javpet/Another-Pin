class OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(form_params)

    if @order.save
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
    params.require(:order).permit(:first_name, :last_name, :email, :address_1, :address_2, :city, :country, :postal_code)
  end
end
