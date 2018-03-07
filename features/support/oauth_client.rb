class OAuthClient

  include Capybara::DSL
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

  def save_token(url)
    @token = OAuth2::AccessToken.from_kvform(client, token_params(url))
  end

  def verify_loa_scope(group)
    level = group.gsub!(/\D/, '')
    @scope == "http://idmanagement.gov/ns/assurance/loa/#{level}"
  end

  def verified?
    puts "Payload Verified Value: #{payload['verified']}"
    payload["verified"] == true
  end

  def authenticated_as?(email)
    puts "Payload Email Value: #{payload['email']}"
    payload["email"] == email
  end

  def has_affiliation?(group)
    puts "Payload Affiliation Value: #{affiliation_payload}"
    affiliation_payload == group
  end

  def affiliation_payload
    payload["affiliation"]
  end

  def payload
    @payload ||= JSON.parse(@token.get(api_endpoint).body)
  end

  def logout
    click_link("Log out")
  end

  def login_with_facebook
    click_link("Facebook")
    fill_in "email", :with => FigNewton.oauth.facebook_user
    fill_in "pass", :with => FigNewton.oauth.facebook_pw
    find("#loginbutton").click
  end

  def login_with_google
    click_link("Google")
    fill_in "identifier", :with => FigNewton.oauth.google_user
    find("#identifierNext").click
    fill_in "password", :with => FigNewton.oauth.google_pw
    sleep 2 # waits for "next" button to load
    find("#passwordNext").click
  end

   def login_with_linkedin
    click_link("LinkedIn")
    fill_in "session_key", :with => FigNewton.oauth.linkedin_user
    fill_in "session_password", :with => FigNewton.oauth.linkedin_pw
    find(".allow").click
  end

  private

  def client
    @client ||= OAuth2::Client.new(@client_id, @client_secret, :site => @endpoint)
  end

  def api_endpoint
    @api_endpoint ||= "#{@endpoint}/api/public/v2/data.json?access_token=#{@token.token}"
  end

  def token_params(url)
    url.match(/[^#]*$/).to_s
  end

end
