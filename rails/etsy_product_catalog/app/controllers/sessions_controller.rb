class SessionsController < ApplicationController


  def initialize(verify, authorize, attributes = {})
    @verify = verify
    @authorize = authorize
    @attributes = { :request_token => "50e88cc126b51d771fd48c6843751f", 
      :request_secret => "5168813cf0",
      :access_token => "h2mg3x3rbmca0ylpod65jp02", 
      :access_secret => "g6fm9aek57" }
  end

  def verify
    request_token = Etsy.request_token
    session[:request_token]  = request_token.token
    session[:request_secret] = request_token.secret
    redirect_to Etsy.verification_url
  end 

  def authorize
    access_token = Etsy.access_token(
    session[:request_token],
    session[:request_secret],
    params[:oauth_verifier])
  end

=begin
  def consumer # :nodoc:
    path = '/v2/oauth/'
    @consumer ||= OAuth::Consumer.new(@attributes[:access_token], @attributes[:access_secret], {
      :site               => "https://openapi.etsy.com",
      :request_token_path => "/v2/oauth/request_token?scope=",,
      :access_token_path  => "/v2/oauth/access_token" })
  end
=end

end
