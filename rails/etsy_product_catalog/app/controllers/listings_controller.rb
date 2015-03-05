class ListingsController < ApplicationController

  def index
    @listings = Listing.all.includes(:images)
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def add_to_cart
   @listing_id = Listing.where(id: params[:id]).pluck(:etsy_listing_id).first
   @current_user_id = session[:user_id]
   @token = User.where(etsy_user_id: @current_user_id).pluck(:access_token).first 
   @secret = User.where(etsy_user_id: @current_user_id).pluck(:access_secret).first
   logger.info "Current User is #{@current_user_id}"
   Etsy::Request.post("/users/#{@current_user_id}/carts", access_token: @token, access_secret: @secret, listing_id: @listing_id)

   redirect_to root_url

  end


end
