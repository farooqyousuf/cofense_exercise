Given(/^I click on Forgot password$/) do
  @idp_sign_up = IDPSignUp.new
  @idp_sign_up.forgot_password_link
end

Given(/^I send the forgot password code to a "([^"]*)" email account$/) do |type|
  @idp_pw_reset = IDPPasswordReset.new
  email_address = case type
                  when "valid"                         then FigNewton.oauth_tester.valid
                  when "valid1"                        then FigNewton.oauth_tester.valid1
                  when "valid2"                        then FigNewton.oauth_tester.valid2
                  when "nonexistent"                   then FigNewton.nonexistent
                  else fail("No email address found")
                  end
  @idp_pw_reset.fill_in_email(email_address)
  @idp_pw_reset.continue_button
end

Given(/^I reset my password$/) do
  @idp_pw_reset.reset_password
  step 'I should see the green alert box error message "Your password has been successfully reset."'
end

Given(/^I verify I can login with the newly reset password$/) do
  step 'I login as a "valid" user'
end

