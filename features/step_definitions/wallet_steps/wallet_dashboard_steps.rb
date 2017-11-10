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

Given(/^I verify that all the main nav tab links are directing to correct pages$/) do
  @WalletDashboard.click_on_business_shared_nav_tab
  expect(page).to have_current_path(FigNewton.idme.business_page, :url => true)
end

Given(/^I verify that all the sub\-nav tab links are directing to correct pages$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
