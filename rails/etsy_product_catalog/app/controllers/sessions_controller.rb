class SessionsController < ApplicationController

  def verify
    request_token = Etsy.request_token
    session[:request_token]  = request_token.token
    session[:request_secret] = request_token.secret
    redirect_to Etsy.verification_url
  end 

  def authorize
    access_token = Etsy.access_token(session[:request_token], 
      session[:request_secret], 
      params[:oauth_verifier])
    user = Etsy.myself(access_token.token, access_token.secret)
    User.create(etsy_user_name: user.result['login_name'], access_token: user.token, access_token: user.secret)
  end


end
