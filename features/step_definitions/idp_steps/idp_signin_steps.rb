Given(/^I login as a "([^"]*)" user$/) do |user_type|

  user = case user_type
         when "Unverified"              then FigNewton.oauth_tester.unverified
         when "nonexistent email"       then FigNewton.oauth_tester.nonexistent
         when "valid"                   then FigNewton.oauth_tester.valid
         when "current_username"        then @username
         when "LOA1"                    then FigNewton.oauth_tester.loa1
         when "LOA2"                    then FigNewton.oauth_tester.loa2
         when "LOA3"                    then FigNewton.oauth_tester.loa3
         else fail ("User not found!")
         end

  password = FigNewton.oauth_tester.general_password

  @idp_signin = IDPSignIn.new
  @idp_signin.sign_in(user, password)
end

Given(/^I should be successfully authenticated using "([^"]*)"$/) do |method|
  @oauth_tester = OAuthTester.new

  person = case method
           when "Facebook"      then FigNewton.oauth_tester.facebook_user
           when "Google"        then FigNewton.oauth_tester.google_user
           when "LinkedIn"      then FigNewton.oauth_tester.linkedin_user
           when "Twitter"       then FigNewton.oauth_tester.twitter_user
           else fail ("Error!")
           end

  expect(@oauth_tester.authenticated_as?(person)).to eq(true)
end

Given(/^I should be successfully verified(?: as "(.*)")?$/) do |group|
  # Support both oauth_tester and new oauth_client until all tests are converted to use only oauth_client
  oauth = @oauth_tester ? @oauth_tester : @oauth_client
  flag = ["LOA1", "LOA2", "LOA3"].include?(group)

  if flag == true
    expect(oauth.verify_loa_scope(group)).to eq(true)
  else
    expect(oauth.verified?).to eq(true)
    expect(oauth.has_affiliation?(group)).to eq(true) if group
  end

end

Given(/^I login with an invalid password$/) do
  @idp_signin.invalid_pw(@username)
end

Given(/^I create the test conditions for Login with invalid password$/) do
  step 'I click on the Sign Up link'
  step 'I sign up as a new user'
  step 'I logout of the OAuth Tester'
  step 'I visit the OAuth Tester'
  step 'I select the "Marketplace" policy'
end

Given(/^I login with Facebook$/) do
  @oauth_tester = OAuthTester.new
  @oauth_tester.login_with_facebook

  @idp_new_wallet = IDPNewWallet.new
  @idp_new_wallet.click_joining_first_time
  @idp_new_wallet.check_tos_pp
  @idp_new_wallet.click_continue_button
end
