class OrderMailer < ApplicationMailer

  def receipt(order)
    # We want to use @order in the views
    @order = order

    mail to: @order.email, subject: "Thank you for ordering from AnotherPin co!"
  end
end
