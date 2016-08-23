
Given(/^I create a WalletHomepage page object$/) do
  @wallet_homepage = WalletHomepage.new 
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
 find(".site-header__extra-links a",:text => "Wallet").click 
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
