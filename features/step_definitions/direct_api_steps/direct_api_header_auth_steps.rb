Given(/^I set valid authorization header$/) do
  @header = { Authorization: FigNewton.direct_api.header_auth}
end

Given(/^I send a POST request with headers to ARCS$/) do
  @response = HTTParty.post("#{FigNewton.oauth.idp_endpoint}/api/direct/v2/verify",
                            :query   => @request_params,
                            :headers => @header)
end
