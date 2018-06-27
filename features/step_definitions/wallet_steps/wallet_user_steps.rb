Given(/^I click on the Wallet Sign Up link$/) do
  click_link "Sign Up"
end

Given("I click on the Wallet My Account link") do
  @WalletHomepage.click_my_account_button
end

Given(/^I should be on the Shop landing page$/) do
  find(".hero--store-grid") #holder allow page to load
  expect(page.current_url).to eql(FigNewton.shop.shop_homepage)
  expect(page).to have_css(".site-header__extra-links",:text =>"About Business Wallet")
  expect(page).to have_css(".hero--store-grid .heading",:text =>"Shop Exclusive Deals and Cash Back")
end

Given(/^I click on the Wallet shared nav link$/) do
  find(".shared-nav a",:text =>"Wallet").click
end

Given(/^I should be on the Wallet dashboard page$/) do
  find(".wallet-dashboard-module") #holder allow page to load
  expect(page).to have_current_path(FigNewton.wallet.homepage.url)
  expect(page).to have_css(".wallet-content-main .heading",:text =>"Dashboard")
end

Given(/^I should see my sign up on the activity feed$/) do
  expect(page).to have_css(".wallet-events li:nth-child(1)",:text =>"You signed up for ID.me Wallet on")
end

Given(/^I login to wallet as a "([^"]*)" user$/) do |affinity_group|
  user_email = case affinity_group
    when "Military" then FigNewton.shop_users.military
  end

  @WalletHomepage.sign_in(user_email)
end

Given(/^I should see my sign in on the activity feed$/) do
  expect(page).to have_css(".wallet-events li:nth-child(1)",:text =>"You signed in to your ID.me Wallet")
end


Given(/^I should see a IDP failed attempt sign in error$/) do
  expect(page).to have_css(".alert",:text => "The email or password you entered is incorrect.")
end

Given(/^I should see my failed sign in on the activity feed$/) do
  expect(page).to have_css(".wallet-events li:nth-child(1)",:text =>"You signed in to your ID.me Wallet")
  expect(page).to have_css(".wallet-events li:nth-child(2)",:text =>"You had an unsuccessful sign in attempt on")
end


Given(/^I fail a attempt to login to wallet$/) do
  @WalletHomepage.incorrect_sign_in
end

Given(/^I click to verify a military group affiliation$/) do
  find(:link , :href =>"https://wallet-staging.idmeinc.net/ids/new?scope=military").click
  close_current_browser
  use_last_browser_created
end

Given(/^I verify my military group affiliation has been added$/) do
  expect(page).to have_css(".card-group .card-military")
end

Given(/^I should see my military group addition on the activity feed$/) do
  expect(page).to have_css(".wallet-events li:nth-child(1)",:text =>"You added Military to your ID.me Wallet on")
end

Given(/^I record the wallet user email$/) do
  @WalletDashboard.open_shared_side_navigation
  @user_identifier = find(".shared-nav-user-menu-details li:nth-child(2)").text
  @WalletDashboard.close_shared_side_navigation
  @user_email = @user_identifier #required for lockout feature to work TODO: refactor lockout so all use same instance variable
  sleep 1
end

Given(/^I deactivate my Wallet account$/) do
  step 'I visit "WalletSettings"'

  @WalletSettings.switch_to_security_tab
  @WalletSettings.deactivate_wallet_user_account

  expect(page).to have_text("Your request to deactivate your account was received and will be processed shortly.")
end

Given(/^I confirm that my Wallet session has been terminated$/) do
  page.driver.browser.navigate.refresh
  step 'I should see the red alert box error message "You need to sign in or sign up before continuing."'
end

Given(/^I verify my Wallet account has been deactived$/) do
  @WalletHomepage.sign_in(@user_identifier)
  step 'I should see the red alert box error message "The email or password you entered is incorrect."'
end

Given(/^I log out of Wallet user account$/) do
  @WalletDashboard.open_shared_side_navigation
  @WalletDashboard.click_shared_side_navigation_sign_out
end

Given(/^I verify my Wallet lock and unlock on the Wallet activity feed$/) do
  expect(page).to have_css(".wallet-events li:nth-child(1)",:text =>"You signed in to your ID.me Wallet")
  expect(page).to have_css(".wallet-events li:nth-child(2)",:text =>"Your ID.me Wallet was unlocked on")
  expect(page).to have_css(".wallet-events li:nth-child(3)",:text =>"Your ID.me Wallet was locked due to too many failed sign in attempts on")
end


Given(/^I signup with LinkedIn social federation$/) do
  @oauth_client = OAuthClient.new
  step 'I login with LinkedIn'
  step 'I complete the new Wallet account linking process'
end

Given(/^I verify my Wallet LinkedIn Social Federation login$/) do
  step 'I should be on the Wallet dashboard page'
  expect(page).to have_css(".wallet-events li:nth-child(2)",:text =>"You signed in with your Linkedin login on")
  expect(page).to have_css(".wallet-events li:nth-child(4)",:text =>"You signed up for ID.me Wallet using your Linkedin login on")
end

Given(/^I signin with LinkedIn social federation$/) do
  @oauth_client = OAuthClient.new
  step 'I login with LinkedIn'
end

Given(/^I verify my Wallet Linkedin Social Federation signin$/) do
  expect(page).to have_current_path(FigNewton.wallet.homepage.social_federation_url)
  expect(page).to have_css(".wallet-events li:nth-child(1)",:text =>"You signed in to your ID.me Wallet")
  expect(page).to have_css(".wallet-events li:nth-child(2)",:text =>"You signed in with your Linkedin login on")
end
