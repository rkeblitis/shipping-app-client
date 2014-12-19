class CartController < ApplicationController

  def create
    if current_order.items.create(product_id: params[:product_id])
      redirect_to cart_path
      # send an api request to ship-to-me
      # include the weight, dimenions, cylinder of the package in the cart
      # shipping location params
      @estimate = HTTParty.get("http://localhost:4000/rates", query: {
        origin: {country: "USA", state: "WA", city: "Seattle", zip: "98103"},
        destination: {country: "USA", state: "NJ", city: "Bordentown", zip: "08505"
          }}).parsed_response
          raise

    end
  end

  def show

  end


end
