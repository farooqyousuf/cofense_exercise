Given(/^I check the Wallet dashboard page is visible$/) do
 expect(page).to have_css(".wallet-content-main",:visible => true)
 expect(page).to have_css(".wallet-dashboard-module",:visible => true)
 expect(page).to have_text "ACTIVITY FEED"
 end

Given(/^I click on the shared side navigation$/) do
  @WalletDashboard.open_shared_side_navigation
end

Given(/^I click sign out on the shared side navigation$/) do
  @WalletDashboard.click_shared_side_navigation_sign_out
end
