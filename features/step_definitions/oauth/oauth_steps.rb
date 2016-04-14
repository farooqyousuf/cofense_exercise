Given(/^I visit IDP through the "([^"]*)" policy$/) do |policy|
  handle = policy_handle(policy)
  @oauth = OAuthClient.new(
             :client_id     => FigNewton.oauth.client_id,
             :client_secret => FigNewton.oauth.client_secret,
             :site          => FigNewton.oauth.idp_endpoint,
             :redirect_uri  => FigNewton.oauth.redirect_uri,
             :scope         => FigNewton.oauth.policy.send(handle)
           )
  visit @oauth.idp_endpoint
end

Given(/^I receive the access token$/) do
  @oauth.get_token(token_params)
end


private

def token_params
  current_url.match(/[^#]*$/).to_s
end

def policy_handle(policy)
  case policy
  when "Developer"
    "developer"
  when "Farooq's Policy"
    "farooq"
  when "Marketplace Government"
    "government"
  when "FICAM LOA1"
    "ficam_loa_1"
  when "FICAM LOA2"
    "ficam_loa_2"
  when "FICAM LOA3"
    "ficam_loa_3"
  when "Marketplace"
    "marketplace"
  when "Marketplace Edit User"
    "marketplace_edit"
  when "Marketplace Military"
    "military"
  when "Marketplace Military Enforced"
    "military-enforced"
  when "Marketplace SCRA"
    "military_scra"
  when "Payfone"
    "payfone"
  when "Marketplace Responder"
    "responder"
  when "Marketplace Student"
    "student"
  when "Marketplace Teacher"
    "teacher"
  when "Wallet"
    "wallet"
  end
end
