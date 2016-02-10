Given(/^I update the user profile name and submit\.$/) do
  @mp_user_settings.fill_in_name
  expect(@mp_user_settings.profile_menu_name).to eql(FigNewton.marketplace.user_fname)
end

Given(/^I check the user subscribed checkbox and save the Changes$/) do
  @mp_user_settings.subscribe_to_email
end

Given(/^I check that user has been subscribed in marketplace$/) do
  expect(@mp_user_settings.user_subscribed).to be(true)
end

Given(/^I create a Marketplace User Setting Page Object$/) do
  @mp_user_settings = MarketplaceUserSettingsPage.new
end

Given(/^I create a Marketplace account edit page object$/) do
  @mp_user_account_settings = MarketplaceUserSettingsPage.new
end

##user account page

Given(/^I enter "([^"]*)" into user account password field$/) do |password|
  @mp_user_account_settings.enter_initial_password
end

Given(/^I enter "([^"]*)" into confirm user account password field$/) do |confirm_password|
  @mp_user_accounts_settings.enter_confirm_password
end

Given(/^I should see "([^"]*)" error message appear for user account$/) do |error_message|
  expect(page.has_text?(error_message)).to be(true) #this might be duplication? check if capybara has_text fails silently
end

Given(/^I click update button$/) do
  click_button "Update"
end
