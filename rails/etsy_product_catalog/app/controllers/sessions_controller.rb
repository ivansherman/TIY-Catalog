class SessionsController < ApplicationController

  def verify
    request_token = Etsy.request_token
    session[:request_token]  = request_token.token
    session[:request_secret] = request_token.secret
    redirect_to Etsy.verification_url   
  end 

  def authorize
<<<<<<< HEAD
    access_token = Etsy.access_token(session[:request_token], 
      session[:request_secret], 
      params[:oauth_verifier])
    user = Etsy.myself(access_token.token, access_token.secret)
    User.create(etsy_user_name: user.result['login_name'], access_token: user.token, access_token: user.secret)
=======
    access_token = Etsy.access_token(
    session[:request_token],
    session[:request_secret],
    params[:oauth_verifier])
    user = Etsy.myself(access_token.token, access_token.secret)
    User.find_by_username(user.result['login_name']) || User.create(username: user.result['login_name'], access_token: user.token, access_secret: user.secret, etsy_user_id: user.result['user_id'])
    session[:user_id] = user.id 
    redirect_to root_url
>>>>>>> de8d4f2bccd4c32f8e5e719b3d46ba35410fe722
  end


end



