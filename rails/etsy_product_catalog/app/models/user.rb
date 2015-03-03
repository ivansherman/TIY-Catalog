class User < ActiveRecord::Base

=begin

  def client_from_access_data # :nodoc:
    OAuth::AccessToken.new(consumer, @attributes[:access_token], @attributes[:access_secret])
  end

  def client # :nodoc:
    @client ||= has_access_data? ? client_from_access_data : client_from_request_data
  end

  def self.get(resource_path, parameters = {})
    request = Request.new(resource_path, parameters)
    Response.new(request.get)
  end

  def self.post(resource_path, parameters = {})
    request = Request.new(resource_path, parameters)
    Response.new(request.post)
  end

  def self.put(resource_path, parameters = {})
    request = Request.new(resource_path, parameters)
    Response.new(request.put)
  end

  def self.delete(resource_path, parameters = {})
    request = Request.new(resource_path, parameters)
    Response.new(request.delete)
  end

  def get(endpoint)
    client.get(endpoint)
  end

  def post(endpoint)
    client.post(endpoint)
  end

  def put(endpoint)
    client.put(endpoint)
  end
  
  def delete(endpoint)
    client.delete(endpoint)
  end

  private
  
  def secure_client
      SecureClient.new(:access_token => @token, :access_secret => @secret)
  end

  def basic_client
    BasicClient.new
  end

  def secure?
    !@token.nil? && !@secret.nil?
  end

  def add_oauth(req)  ### to use the gem
    client.sign!(req)
  end

  def has_access_data?
    !@attributes[:access_token].nil? && !@attributes[:access_secret].nil?
  end
=end
end
