Given(/^I visit IDP through the "([^"]*)" policy$/) do |policy|
  @oauth_client = OAuthClient.new(
                    :client_id     => FigNewton.oauth.client_id,
                    :client_secret => FigNewton.oauth.client_secret,
                    :endpoint      => FigNewton.oauth.idp_endpoint,
                    :redirect_uri  => FigNewton.oauth.redirect_uri,
                    :scope         => FigNewton.oauth.policy.send(handle(policy))
                  )

  visit @oauth_client.auth_url
end

private

def handle(policy)
  policies = {
    "Developer"                     => "developer",
    "Farooq's Policy"               => "farooq",
    "Marketplace Government"        => "government",
    "FICAM LOA1"                    => "ficam_loa_1",
    "FICAM LOA2"                    => "ficam_loa_2",
    "FICAM LOA3"                    => "ficam_loa_3",
    "Marketplace"                   => "marketplace",
    "Marketplace Edit User"         => "marketplace_edit",
    "Marketplace Military"          => "military",
    "Marketplace Military Enforced" => "military-enforced",
    "Marketplace SCRA"              => "military_scra",
    "Payfone"                       => "payfone",
    "Marketplace Responder"         => "responder",
    "Marketplace Student"           => "student",
    "Marketplace Teacher"           => "teacher",
    "Wallet"                        => "wallet"
  }

  policies[policy]
end
