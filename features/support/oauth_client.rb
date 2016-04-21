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

  def has_affiliation?(group)
    puts "Payload Affiliation Value: #{payload['affiliation']}"
    payload["affiliation"] == group
  end

  def authenticated_as?(person)
    first_name = person.gsub(/\w+$/,"")
    last_name = person.gsub(/^\w+/,"")
    puts "Payload Full Name Value: #{payload['fname']} " + "#{payload['lname']}"
    payload["fname"] == first_name.strip
    payload["lname"] == last_name.strip
  end

  def payload
    @payload ||= JSON.parse@token.get(api_endpoint).body
  end

  def logout
    visit("https://oauth-tester-staging.idmeinc.net/oauths/6/logout")
  end

  def login_with_facebook
    find("img[alt='Facebook']").click
    fill_in "email", :with => "qnkuwmb_sadanberg_1446693931@tfbnw.net"
    fill_in "pass", :with => "facebooktest"
    #prod: qa@id.me / P@ssword123
    find("#loginbutton").click
  end

  def login_with_google
    binding.pry
    find("img[alt='Google Plus']").click
    fill_in "Email", :with => "idme.qa.automation@gmail.com"
    find("#next").click
    fill_in "Passwd", :with => "$taRbuck$"
    find("#signIn").click
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
