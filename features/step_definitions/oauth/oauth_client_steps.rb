Given(/^I visit IDP through the "([^"]*)" policy$/) do |handle|
  @oauth_client = OAuthClient.new(
                    :client_id     => FigNewton.oauth.client_id,
                    :client_secret => FigNewton.oauth.client_secret,
                    :endpoint      => FigNewton.oauth.idp_endpoint,
                    :redirect_uri  => FigNewton.oauth.redirect_uri,
                    :scope         => FigNewton.oauth.policy.send(handle)
                  )

  visit @oauth_client.auth_url
end
