class OAuthTester < IDmeBase

  include IDPBase

 def initialize
   super("https://oauth-tester-staging.idmeinc.net/oauths/new")
 end

 def create_test_env(org, consumer, policy)
   select(org, :from => "organization")
   select(consumer, :from => "consumer")
   select(policy, :from => "policy")
   click_button("Authenticate")
   return IDPSignIn.new
 end

 def json_verification_css
   "div.json.verification"
 end

 def json_scope_css
   "div.json.scope"
 end

 def verify_loa_scope(level)
   level_regexed = level.gsub!(/\D/, '')
   has_css?(json_scope_css, :text => "http://idmanagement.gov/ns/assurance/loa/#{level_regexed}")
 end

 def verification_status
   has_css?(json_verification_css, :text => "\"verified\": true")
 end

 def affiliated_as(group)
   has_css?(json_verification_css, :text => "\"affiliation\": \"#{group}\"")
 end

 def logout
   click_link("Logout »")
 end

end
