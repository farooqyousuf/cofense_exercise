Given(/^I update the user profile name and submit\.$/) do
  @mp_user_settings.fill_in_name
  expect(@mp_user_settings.profile_menu_name).to eql(FigNewton.marketplace.user_fname)
end

Given(/^I check the user subscribed checkbox and save the Changes$/) do
  @mp_user_settings.visit_subscription_settings_tab
  expect(page).to have_text("Manage your email subscriptions")

  @mp_user_settings.reset_if_already_subscribed #TODO: find better solution to reseting this with either hook or just delete user
  @mp_user_settings.subscribe_to_email
end

Given(/^I check that user has been subscribed in marketplace$/) do
  expect(@mp_user_settings.user_subscribed).to be(true)
end

Given(/^I create a Marketplace User Setting Page Object$/) do
  @mp_user_settings = MarketplaceUserSettingsPage.new
end

Given(/^I create a Marketplace account edit page object$/) do
  @mp_user_account_settings = MarketplaceUserAccountEditPage.new
end

##user account page

Given(/^I enter "([^"]*)" into user account password field$/) do |password|
  @mp_user_account_settings.enter_initial_password(password)
end

Given(/^I enter "([^"]*)" into confirm user account password field$/) do |confirm_password|
  @mp_user_account_settings.enter_confirm_password(confirm_password)
end

Given(/^I should see "([^"]*)" error message appear for user account$/) do |error_message|
  expect(page.has_text?(error_message)).to be(true) #this might be duplication? check if capybara has_text fails silently
end

Given(/^I click update button$/) do
  click_button "Update"
end

#successfully updating user password

Given(/^I update the user account password$/) do
  @mp_user_account_settings.enter_correct_password_fields
  step "I click update button"
  expect(page.has_text?("Account updated successfully")).to be(true)
end

Given(/^I check that the user account password has successfully updated\.$/) do
  @mp_user_account_settings.sign_out
  #check url
  click_link "Sign In"
  @mp_user_account_settings.new_sign_in
  expect(find(:link,:href =>"/cash-back").text).to eql(FigNewton.marketplace.user_fname)
end
