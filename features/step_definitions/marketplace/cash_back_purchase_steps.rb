Given(/^I click on SignIn link$/) do
  click_link "Sign In"
end

Given(/^I click on the Sign up link$/) do
  first(:link, "Sign Up").click
end

Given(/^I login to marketplace as a "([^"]*)" user$/) do |user_type|
  user = case user_type
         when "Military"       then FigNewton.mp_users.military
         end

  @marketplace_shop = MarketplaceLandingPage.new
  @marketplace_shop.sign_in(user, FigNewton.mp_users.general_password)
end

Given(/^Cash Back Activity Tab should be selected$/) do
  @marketplace_my_cash_page = CashBack_PurchasesPage.new #find better placement for this?
  expect(@marketplace_my_cash_page.cash_back_activity_tab_selected).to be(true)
end

Given(/^I check Summary Info Card existence$/) do
  expect(@marketplace_my_cash_page.cash_back_summary_section.visible?).to be(true)
end



Given(/^I check Next Payment Info Card existence$/) do
  expect(@marketplace_my_cash_page.next_payment_summary_section.visible?).to be(true)
end

Given(/^I check Purchases Table existence$/) do
  expect(@marketplace_my_cash_page.purchase_table_section.visible?).to be(true)
end

Given(/^I check Purchases Table content$/) do
  expect(@marketplace_my_cash_page.check_purchases_made).to be(true)
end


Given(/^I create a marketplace purchase with cash back for the user$/) do
  @marketplace_cash_back_api = MarketplaceCashBackPage.new 
  @marketplace_cash_back_api.create_cash_back_purchase(@offer_cms_admin.user_uid)
end


Given(/^I check that the cash back is displayed on the Summary Info Card$/) do
  expect(page).to have_css("div .column:nth-child(1) .cash",:text =>"$6.60")
end

Given(/^I check that the cash back is displayed on the Purchases Table$/) do
  expect(page).to have_css("#cash-back-purchases tbody td:nth-child(5)",:text =>"$6.60")
end

Given(/^I save the new user email$/) do
  @admin_user = AdminUsers.new 
  @admin_tool = AdminTool.new
  @admin_user.record_test_user_email
end

Given(/^I create a review for the Cash Back purchase$/) do
  page.execute_script "window.scrollBy(0,1000)"
  find(".button",:text => "Write Review").click
  find(".review_rating i:nth-child(4)").click
  fill_in("review_name",:with =>"William Wallace")
  click_button "Submit Review"
  expect(page).to have_css(".alert", :text =>"Successfully reviewed Fanatics")
end

Given(/^I check that the review is displayed on the merchant page$/) do
  #redirects to fanatics page
  expect(page.current_url).to eql(FigNewton.marketplace.merchant_page)
  find(".reviews").click 
  expect(page).to have_css(".store-offers-list li:nth-child(1)",:text => FigNewton.marketplace.merchant_review_text)
end


Given(/^I check that payment settings dashboard is visible$/) do
  @marketplace_my_cash_page = CashBack_PurchasesPage.new
  expect(page).to have_css(".dashboard__payment-info")
  expect(page).to have_css(".dashboard__payment-info .title",:text =>"We need some information to send your future cash back payments!")
  expect(page).to have_css(".dashboard__payment-info .button",:text =>"Update Payment Settings")
end

Given(/^I check the payment settings modal$/) do
  @marketplace_my_cash_page.click_update_payment_settings_dashboard_button
  expect(page).to have_css(".modal-header",:text => "Update Your Payment Information Confirm your information below for future cash back payments!")
  expect(page).to have_css(".payment-option-radios span:nth-child(1)",:text =>"PayPal")
  expect(page).to have_css(".payment-option-radios span:nth-child(2)",:text =>"Amazon.com Gift Card")
  expect(page).to have_css(".modal-block input[value='Update Payment Settings']")

  @marketplace_my_cash_page.click_update_payment_settings_modal_button
end

Given(/^I update my payment information to receive via Amazon gift card$/) do
  @marketplace_my_cash_page.click_update_payment_settings_dashboard_button
  @marketplace_my_cash_page.select_amazon_payment_method 
  
  expect(page).to have_css(".payment-option-radios span:nth-child(2)[class='active']")
  expect(page).to have_css(".core_user_payment_method_amazon_gift_card .heading",:text =>"Receive Payment Through Amazon.com")
  
  @marketplace_my_cash_page.click_update_payment_settings_modal_button
  
  expect(page).to have_css(".alert",:text => "Successfully updated payment information") 
  expect(page).to have_css(".dashboard__payment-info img[alt='Amazon.com']")
end

Given(/^I update my payment information to receive via Paypal$/) do
  @marketplace_my_cash_page.click_update_payment_settings_dashboard_button
  @marketplace_my_cash_page.select_paypal_payment_method

  expect(page).to have_css(".core_user_payment_method_paypal .heading",:text =>"Receive Payment Through PayPal")
  expect(page).to have_css(".payment-option-radios span:nth-child(1)[class='active']")

  @marketplace_my_cash_page.enter_paypal_email
  @marketplace_my_cash_page.click_update_payment_settings_modal_button

  expect(page).to have_css(".alert",:text =>"Successfully updated payment information")
  expect(page).to have_css(".dashboard__payment-info img[alt='PayPal']")
end

Given(/^I incorrectly update my paypal account information and see a error message$/) do
  @marketplace_my_cash_page.click_update_payment_settings_dashboard_button
  @marketplace_my_cash_page.select_paypal_payment_method

  expect(page).to have_css(".core_user_payment_method_paypal .heading",:text =>"Receive Payment Through PayPal")
  expect(page).to have_css(".payment-option-radios span:nth-child(1)[class='active']")
 
  @marketplace_my_cash_page.click_update_payment_settings_modal_button
 
  expect(page).to have_css(".alert", :text =>"Unable to update payment information. Paypal account can't be blank")
end


