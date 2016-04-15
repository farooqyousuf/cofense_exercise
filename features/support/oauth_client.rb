class OAuthClient

  require 'oauth2'

  def initialize(options = {})
    @client_id     = options[:client_id]
    @client_secret = options[:client_secret]
    @endpoint      = options[:endpoint]
    @redirect_uri  = options[:redirect_uri]
    @scope         = options[:scope]
  end

  def auth_url
    client.implicit.authorize_url(:redirect_uri => @redirect_uri, :scope => @scope)
  end

  def save_token(token_params)
    @token ||= OAuth2::AccessToken.from_kvform(client, token_params)
  end

  def verify_loa_scope(group)
    level = group.gsub!(/\D/, '')
    @scope == "http://idmanagement.gov/ns/assurance/loa/#{level}"
  end

  def verified?
    api_endpoint = "#{@endpoint}/api/public/v2/data.json?access_token=#{@token.token}"
    response = get_response(api_endpoint)
    response["verified"] == true
  end

  def affiliated_as?(group)
    api_endpoint = "#{@endpoint}/api/public/v2/affiliation.json?access_token=#{@token.token}"
    response = get_response(api_endpoint)
    response["affiliation"] == group
  end

  private

  def client
    @client ||= OAuth2::Client.new(@client_id, @client_secret, :site => @endpoint)
  end

  def get_response(api_endpoint)
    JSON.parse@token.get(api_endpoint).body
  end

end
