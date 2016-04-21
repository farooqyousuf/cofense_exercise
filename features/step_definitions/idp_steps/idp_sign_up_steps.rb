Given(/^I click on the Sign Up link$/) do
  @idp_signin = IDPSignIn.new
  @idp_signin.click_sign_up_link
end

Given(/^I sign up as a new user$/) do
  @idp_sign_up = IDPSignUp.new
  @idp_sign_up.sign_up
  @username = @idp_sign_up.username
  @idp_sign_up.click_sign_up_button
end

Given(/^I fill in the Sign Up textfield$/) do
  @idp_sign_up = IDPSignUp.new
  @idp_sign_up.unique_username
end

Given(/^I click on the Sign Up button$/) do
  @idp_sign_up.click_sign_up_button
end

Given(/^I fill in the Password textfield$/) do
  @idp_sign_up.fill_in_password(FigNewton.oauth.general_password)
end

Given(/^I fill in the Password Confirmation textfield$/) do
  @idp_sign_up.fill_in_password_confirmation
end
