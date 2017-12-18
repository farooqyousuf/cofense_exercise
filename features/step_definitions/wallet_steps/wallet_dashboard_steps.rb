Given(/^I check the Wallet dashboard page is visible$/) do
 expect(page).to have_css(".wallet-content-main",:visible => true)
 expect(page).to have_css(".wallet-dashboard-module",:visible => true)
 expect(page).to have_text "Activity Feed"
 end

Given(/^I click on the shared side navigation$/) do
  @WalletDashboard.open_shared_side_navigation
end

Given(/^I click sign out on the shared side navigation$/) do
  @WalletDashboard.click_shared_side_navigation_sign_out
end

Given(/^I verify ID\.me logo is present$/) do
  expect(page).to have_css("img.shared-nav-logo")
 end

Given(/^I verify that the main nav Shop link takes me to the correct page$/) do
  @WalletDashboard.click_on_shop_shared_nav_tab
  expect(page).to have_current_path(FigNewton.shop.shop_homepage, :url => true)
end

Given(/^I verify that the main nav About link takes me to the correct page$/) do
  @WalletDashboard.click_on_about_shared_nav_tab
  expect(page).to have_current_path(FigNewton.idme.about_page, :url => true)
end

Given(/^I verify that the main nav Wallet link takes me to the correct page$/) do
  @WalletDashboard.click_on_wallet_shared_nav_tab_from_about_page
  expect(page).to have_current_path(FigNewton.wallet.homepage.url, :url => true)
end

Given(/^I verify that the main nav Business link takes me to the correct page$/) do
  @WalletDashboard.click_on_business_shared_nav_tab
  expect(page).to have_current_path(FigNewton.idme.business_page, :url => true)
end

Given(/^I verify that the sub\-nav Dashboard link directs me to the correct page$/) do
  @WalletDashboard.click_wallet_subnav_dashboard_tab
  expect(page).to have_current_path("/")
end

Given(/^I verify that the sub\-nav IDs and Logins link directs me to the correct page$/) do
  @WalletDashboard.click_wallet_subnav_ids_logins_tab
  expect(page).to have_current_path("/ids")
end

Given(/^I verify that the sub\-nav Settings link directs me to the correct page$/) do
  @WalletDashboard.click_wallet_subnav_settings_tab
  expect(page).to have_current_path("/settings")
end

Given(/^I verify that the sub\-nav Activity link directs me to the correct page$/) do
  @WalletDashboard.click_wallet_subnav_activity_tab
  expect(page).to have_current_path("/activity")
end

Given(/^I verify user email is displayed$/) do
  account_email = @WalletDashboard.user_account_email
  test_email_used = FigNewton.shop_users.military
  expect(account_email).to eq(test_email_used)
end

Given(/^I verify membership date is displayed correctly$/) do
  membership_date = @WalletDashboard.account_membership_date
  @WalletDashboard.valid_date?(membership_date)
end

Given(/^I verify that View Full Profile link directs me to correct page$/) do
  @WalletDashboard.click_view_profile
  expect(page).to have_current_path("/settings")
  expect(page).to have_css("div.wallet-settings-user")
end

Given("I should be on the Wallet dashboard page url") do
  expect(page).to have_current_path(FigNewton.wallet.homepage.url, :url => true)
end

Given("I verify that IDs and Logins toggle buttons direct me to corresponding page views #IDs or Logins") do
  @WalletDashboard.find_id_toggle
end

Given("I verify required main header sections are visible #IDs and Logins, Activity Feed <h{int}>") do |int|
  pending # Write code here that turns the phrase above into concrete actions
end

Given("I verify required sub header sections are visible #My IDs, Inactive IDs, My Logins, Inactive Logins <h{int}>") do |int|
  pending # Write code here that turns the phrase above into concrete actions
end

Given("I verify that IDs and Logins page buttons are visible #Inactive IDs, Add ID, Inactive logins, Add Login") do
  pending # Write code here that turns the phrase above into concrete actions
end

Given("I verify that Activity Feed is present") do
  pending # Write code here that turns the phrase above into concrete actions
end

Given("I verify that {string} links direct me to corresponding page url") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end
