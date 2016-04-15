class OAuthClient

  require 'oauth2'

  def initialize(options = {})
    @client_id     = options[:client_id]
    @client_secret = options[:client_secret]
    @site          = options[:site]
    @redirect_uri  = options[:redirect_uri]
    @scope         = options[:scope]
  end

  def client
    @client ||= OAuth2::Client.new(@client_id, @client_secret, :site => @site)
  end

  def idp_endpoint
    @auth_url ||= client.implicit.authorize_url(:redirect_uri => @redirect_uri, :scope => @scope)
  end

  def token(token_params)
    @token ||= OAuth2::AccessToken.from_kvform(client, token_params)
  end

end
