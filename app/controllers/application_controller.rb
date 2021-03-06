class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :current_cart
  helper_method :current_cart

  def current_cart
    # if the customer has just landed on the site, give them a brand new cart
    # if they already have one, keep it
    # check session[:cart_id] -- cart_id just made up it can be basically anything

    if session[:cart_id].present?
      # They already have a cart
      @current_cart = Cart.find(session[:cart_id])
    else
      # We need to set up a new one
      @current_cart = Cart.create # This is equals with Cart.new.save
      session[:cart_id] = @current_cart.id
    end
  end
end
