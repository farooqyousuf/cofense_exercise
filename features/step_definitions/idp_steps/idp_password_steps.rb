Given("I click on Forgot password") do
  @idp_sign_up = IDPSignUp.new
  @idp_sign_up.forgot_password_link
end

Given("I send the forgot password code to a {string} email account") do |type|
  @idp_pw_reset = IDPPasswordReset.new
  email_address = case type
                  when "valid"                         then FigNewton.oauth.valid
                  when "valid1"                        then FigNewton.oauth.valid1
                  when "valid2"                        then FigNewton.oauth.valid2
                  when "nonexistent"                   then FigNewton.oauth.nonexistent
                  else fail("No email address found")
                  end
  @idp_pw_reset.fill_in_email_by_name(email_address)
  @idp_pw_reset.click_continue_button
end

Given("I reset my password") do
  @idp_pw_reset.reset_password
  step 'I should see the green alert box error message "Your ID.me password was successfully reset."'
end

Given("I verify I can login with the newly reset password") do
  step 'I login as a "valid" user'
end

Given("I request a new reset password code and unlock my account {string}") do |user_type|
  @idp_pw_reset.resend_code_link
  user_email = case user_type
               when "valid"    then FigNewton.oauth.valid
               when "valid1"   then FigNewton.oauth.valid1
               when "valid2"   then FigNewton.oauth.valid2
               else  user_email = @user_email
               end
  @idp_pw_reset.fill_in_email_by_name(user_email)
  @idp_pw_reset.click_continue_button
  @idp_pw_reset.reset_password
end

Given(/^I enter a wrong reset password code (\d+) times?/) do |number|
  @idp_pw_reset.fill_in_code(FigNewton.oauth.wrong_unlock_code)
  (number.to_i).times do
    @idp_pw_reset.fill_in_password
    @idp_pw_reset.fill_in_password_confirm
    @idp_pw_reset.click_submit_button
  end
end
