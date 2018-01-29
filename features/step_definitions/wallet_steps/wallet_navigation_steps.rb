Given(/^I click on the Dashboard navigation link$/) do
  @WalletNavigation.click_dashboard_link
end

Given(/^I click on the My IDs navigation link$/) do
  @WalletNavigation.click_myids_link
end

Given(/^I check the Wallet My IDs page is visible$/) do
  expect(page).to have_current_path(FigNewton.wallet.myids,:url => true)
  expect(page).to have_css(".wallet-content-main .heading",:text => "IDs")
  expect(page).to have_css(".wallet-toggle-btns",:visible => true)
  expect(page).to have_css(".btn-add-id",:visible => true)
  expect(page).to have_css(".idme-wallet-button-military",:visible => true)
end

Given(/^I click on the Settings navigation link$/) do
	@WalletNavigation.click_settings_link
end

Given(/^I check the Wallet Settings page is visible$/) do
  expect(page).to have_current_path(FigNewton.wallet.settings,:url => true)
  expect(page).to have_css(".mod-wallet-toggle-btns-external",:text =>"Profile Account Security Privacy")
  expect(page).to have_css(".wallet-settings-user")
  expect(page).to have_css(".wallet-table",:visible => true)
end

Given(/^I click on the Activity navigation link$/) do
  @WalletNavigation.click_activity_link
end

Given(/^I check that Wallet Activity page is visible$/) do
  expect(page).to have_current_path(FigNewton.wallet.activity,:url => true)
  expect(page).to have_css(".wallet-content-main .heading",:text =>"Activity Feed")
end

Given("I sign in to Wallet") do
  @WalletHomepage.click_shared_nav_sign_in_button
  step 'I login as a "Unverified" user'
end

Given("I verify that Settings toggle button options direct me to corresponding page views Profile, Account, Security, Privacy") do
  expect(page).to have_css("div.js-toggle-profile.is-active")
  
  @WalletSettings.switch_to_account_tab
  expect(page).to have_css("div.js-toggle-account.is-active")

  @WalletSettings.switch_to_security_tab 
  expect(page).to have_css("div.js-toggle-security.is-active")

  @WalletSettings.switch_to_privacy_tab
  expect(page).to have_css("div.js-toggle-privacy.is-active")
end
