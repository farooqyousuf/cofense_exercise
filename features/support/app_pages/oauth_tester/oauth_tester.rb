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

   IDPSignIn.new
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

 def verified?
   has_css?(json_verification_css, :text => "\"verified\": true")
 end

 def has_affiliation?(group)
   has_css?(json_verification_css, :text => "\"affiliation\": \"#{group}\"")
 end

 def authenticated_as?(person)
   first_name = person.gsub(/\w+$/,"")
   last_name = person.gsub(/^\w+/,"")
   has_css?(json_verification_css, :text => "\"fname\": \"#{first_name.strip}\"")
   has_css?(json_verification_css, :text => "\"lname\": \"#{last_name.strip}\"")
 end

 def logout
   click_link("Logout »")
 end

 def login_with_facebook
   find("img[alt='Facebook']").click
   fill_in "email", :with => "qnkuwmb_sadanberg_1446693931@tfbnw.net"
   fill_in "pass", :with => "facebooktest"
   #prod: qa@id.me / P@ssword123
   find("#loginbutton").click
 end

 end
