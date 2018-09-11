Given("I visit IDP through the {string} policy") do |handle|
  @oauth_client = OAuthClient.new(
                    :client_id     => FigNewton.oauth.client_id,
                    :client_secret => FigNewton.oauth.client_secret,
                    :endpoint      => FigNewton.oauth.idp_endpoint,
                    :redirect_uri  => FigNewton.oauth.redirect_uri,
                    :scope         => FigNewton.oauth.policy.send(handle)
                  )
  visit @oauth_client.auth_url
end

Given("I visit IDP through the au10tix_light policy") do
  @oauth_client = OAuthClient.new(
                    :client_id     => FigNewton.oauth.vets_gov_client_id,
                    :client_secret => FigNewton.oauth.vets_gov_client_secret,
                    :endpoint      => FigNewton.oauth.idp_endpoint,
                    :redirect_uri  => FigNewton.oauth.redirect_uri,
                    :scope         => FigNewton.oauth.policy.send("au10tix_light")
                  )
  visit @oauth_client.auth_url
end

Given("I logout of the OAuth Client") do
  @oauth_client.logout
end
