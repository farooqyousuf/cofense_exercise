Given("I lockout my account") do
  @idp_unlock = IDPUnlock.new
  @idp_unlock.lockout_account(@user_email)
  step 'I should see the red alert box error message "Your account has been locked due to a high number of failed sign-in attempts. Please click here to unlock it."'
end

Given("I click on the unlock account link") do
  @idp_unlock.unlock_link
end

Given("I unlock my account") do
  @idp_unlock.unlock_account(@user_email)
  step 'I should see the green alert box error message "Your ID.me account was successfully unlocked."'
end

Given("I enter a non-existant account email to attempt to unlock my account") do
  @idp_unlock.fill_in_email_by_name(FigNewton.oauth.nonexistent)
  @idp_unlock.click_continue_button
end

Given(/^I enter a wrong unlock code (\d+) times?/) do |number|
  @idp_signin.unlock_link

  @idp_unlock.fill_in_email_by_name(@user_email)
  @idp_unlock.click_continue_button
  @idp_unlock.fill_in_code(FigNewton.oauth.wrong_unlock_code)

    (number.to_i).times do
      @idp_unlock.click_submit_button
    end
end
