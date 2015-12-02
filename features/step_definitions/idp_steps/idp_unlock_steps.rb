Given(/^I lockout my account$/) do
  @idp_unlock = IDPUnlock.new
  @idp_unlock.lockout_account(@username)
  step 'I should see the red alert box error message "Your account has been locked due to a number of failed sign-in attempts. Please click here to unlock it."'
end

Given(/^I click on the unlock account link$/) do
  @idp_unlock.unlock_link
end

Given(/^I unlock my account$/) do
  @idp_unlock.unlock_account(@username)
  step 'I should see the green alert box error message "Your account was successfully unlocked."'
end