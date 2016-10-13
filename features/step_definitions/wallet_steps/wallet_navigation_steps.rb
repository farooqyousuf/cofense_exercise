Given(/^I click on the Dashboard navigation link$/) do
	@WalletNavigation.click_dashboard_link
end

Given(/^I click on the My IDs navigation link$/) do
	@WalletNavigation.click_myids_link
end

Given(/^I check the Wallet My IDs page is visible$/) do
  expect(page).to have_current_path(FigNewton.wallet.myids,:url => true)
  expect(page).to have_css(".wallet-content-main .heading",:text => "My IDs")
  expect(page).to have_css(".wallet-toggle-btns",:visible => true)
  expect(page).to have_css(".btn-add-id",:visible => true)
  expect(page).to have_css(".wallet-list-id-item a img[alt='Troop ID']")
end

Given(/^I click on the Settings navigation link$/) do
	@WalletNavigation.click_settings_link
end

Given(/^I check the Wallet Settings page is visible$/) do
	expect(page).to have_current_path(FigNewton.wallet.settings,:url => true)
	expect(page).to have_css(".mod-wallet-toggle-btns-external",:text =>"PROFILE ACCOUNT SECURITY PRIVACY")
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