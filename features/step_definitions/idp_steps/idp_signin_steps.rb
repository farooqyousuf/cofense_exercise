Given("I login as a {string} user") do |user_type|

  user = case user_type
         when "Unverified"              then FigNewton.oauth.unverified
         when "nonexistent email"       then FigNewton.oauth.nonexistent
         when "valid"                   then FigNewton.oauth.valid
         when "current_username"        then @user_email
         when "LOA1"                    then FigNewton.oauth.loa1
         when "LOA2"                    then FigNewton.oauth.loa2
         when "LOA3"                    then FigNewton.oauth.loa3
         else fail ("User not found!")
         end

  password = FigNewton.oauth.general_password

  @idp_signin = IDPSignIn.new
  @idp_signin.sign_in(user, password)
end

Given("I login with an invalid password") do
  @idp_signin.invalid_pw(@user_email)
end

Given("I create the test conditions for Login with invalid password") do
  step 'I click on the Sign Up link'
  step 'I sign up as a new user'
  step 'I clear the session from Authority'
  step 'I visit IDP through the "shop" policy'
end

Given("I complete the new Wallet account linking process") do
  @idp_new_wallet = IDPNewWallet.new

  if page.has_link? "I am joining ID.me for the first time"
    @idp_new_wallet.click_joining_first_time
    @idp_new_wallet.check_tos_pp
    @idp_new_wallet.click_continue_button
  end

  if page.text.include? "Please create a password for your ID.me Wallet."
    @idp_new_wallet.create_password
    @idp_new_wallet.click_continue_button
  end

  if page.has_css?("#sr_page_title", text: "Create your ID.me account")
    @idp_new_wallet.click_continue_button
    if page.has_css?("#sr_page_title", text: "Verify your military affiliation")
      step 'I verify a military user'
    end
  end
end

Given("I login with Facebook") do
  @oauth_client.login_with_facebook
end

Given("I login with Google") do
  @oauth_client.login_with_google
end

Given("I login with LinkedIn") do
  @oauth_client.login_with_linkedin
end

Given(/^I should be successfully authenticated(?: using "(.*)")?$/) do |method|
  sleep 2
  @oauth_client.save_token(current_url)
  if method
    email = case method
             when "Facebook"      then FigNewton.oauth.facebook_user
             when "Google"        then FigNewton.oauth.google_user
             when "LinkedIn"      then FigNewton.oauth.linkedin_user
             else fail ("Error!")
             end
    expect(@oauth_client.authenticated_as?(email)).to eq(true)
  end

  expect(@oauth_client.verified?).to eq(true)
end
