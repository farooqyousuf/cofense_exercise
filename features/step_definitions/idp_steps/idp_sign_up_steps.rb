Given(/^I click on the Sign Up link$/) do
  @idp_signin = IDPSignIn.new
  @idp_signin.sign_up
end

Given(/^I sign up as a new user$/) do
  @idp_sign_up = IDPSignUp.new
  @idp_sign_up.sign_up
  @username = @idp_sign_up.username
  @idp_sign_up.sign_up_button
end
