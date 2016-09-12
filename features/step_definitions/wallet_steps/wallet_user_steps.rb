
Given(/^I create a WalletHomepage page object$/) do
  @wallet_homepage = WalletHomepage.new 
end

Given(/^I create Wallet page objects$/) do 
  step 'I create a WalletHomepage page object'
  step 'I create a WalletDashboard page object'
  step 'I create a WalletSettings page object'
end 


Given(/^I create a WalletDashboard page object$/) do
  @wallet_dashboard = WalletDashboard.new 
end


Given(/^I create a WalletSettings page object$/) do
  @wallet_settings = WalletSettings.new 
end

Given(/^I click on the Wallet Sign Up link$/) do
  step "I create a WalletHomepage page object"
	click_link "Sign Up"
end

Given(/^I click on the Wallet Sign in link$/) do
  step "I create a WalletHomepage page object"
  first(:link ,:text =>"Sign In").click 
end

Given(/^I should be on the marketplace landing page$/) do
  find(".hero--store-grid") #holder allow page to load 
  expect(page.current_url).to eql(FigNewton.marketplace.shop_homepage)
  expect(page).to have_css(".site-header__extra-links",:text =>"About Business Wallet")
  expect(page).to have_css(".hero--store-grid .heading",:text =>"Shop Exclusive Deals and Cash Back")
end

Given(/^I click on the Wallet shared nav link$/) do
  find(".shared-nav a",:text =>"Wallet")
end

Given(/^I should be on the Wallet dashboard page$/) do
  find(".wallet-dashboard-module") #holder allow page to load 
  expect(page.current_url).to eql(FigNewton.wallet.homepage)
  expect(page).to have_css(".wallet-content-main .heading",:text =>"Dashboard")
  expect(page).to have_css(".wallet-dashboard-module",:visible => true)
  expect(page).to have_css(".wallet-dashboard-module",:visible => true)
end

Given(/^I should see my sign up on the activity feed$/) do
  expect(page).to have_css(".wallet-events li:nth-child(1)",:text =>"You signed in on")
  expect(page).to have_css(".wallet-events li:nth-child(2)",:text =>"You signed up for ID.me Wallet on")
end

Given(/^I login to wallet as a "([^"]*)" user$/) do |affinity_group|
  user_email = case affinity_group
    when "Military" then FigNewton.mp_users.military
  end 

  @wallet_homepage.sign_in(user_email)
end

Given(/^I should see my sign in on the activity feed$/) do
  expect(page).to have_css(".wallet-events li:nth-child(1)",:text =>"You signed in on")
end


Given(/^I should see a IDP failed attempt sign in error$/) do
  expect(page).to have_css(".alert",:text => "The email or password you entered is incorrect. Please try again.")
end

Given(/^I should see my failed sign in on the activity feed$/) do
  expect(page).to have_css(".wallet-events li:nth-child(1)",:text =>"You signed in on")
  expect(page).to have_css(".wallet-events li:nth-child(2)",:text =>"You had an unsuccessful sign in attempt on")
end


Given(/^I fail a attempt to login to wallet$/) do
  @wallet_homepage.incorrect_sign_in
end

Given(/^I click to verify a military group affiliation$/) do
  find(:link , :href =>"https://wallet-staging.idmeinc.net/ids/new?scope=military").click
end

Given(/^I verify my military group affiliation has been added$/) do
  expect(page).to have_css(".wallet-card-group .wallet-card-military:nth-child(1)")
end

Given(/^I should see my military group addition on the activity feed$/) do
  expect(page).to have_css(".wallet-events li:nth-child(1)",:text =>"You added Military to your ID.me Wallet on")
end

Given(/^I record the wallet user email$/) do 
  @wallet_dashboard.open_shared_side_navigation 
  @user_identifier = find(".shared-nav-user-menu-details li:nth-child(2)").text 
  @wallet_dashboard.close_shared_side_navigation 
  sleep 1
end 

Given(/^I deactivate my Wallet account$/) do
  step 'I visit "WalletSettings"'
  
  @wallet_settings.switch_to_security_tab
  @wallet_settings.deactivate_wallet_user_account

  expect(page).to have_text("Your request to deactivate your account was received and will be processed shortly.")
end

Given(/^I confirm that my Wallet session has been terminated$/) do
  page.driver.browser.navigate.refresh
  expect(page).to have_text "500: Internal Server Error Our server has gone off to play foosball..."
end 

Given(/^I verify my Wallet account has been deactived$/) do
  click_link "Sign In"
  @wallet_homepage.sign_in(@user_identifier) 

  expect(page).to have_css(".alert-error",:text =>"We're sorry, this account has been revoked. Please contact our Member Support team for assistance.")
end







