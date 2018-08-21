Given("I click on the Shop {string} navigation link") do |shop_link|
  @ShopCashBackPage.close_out_modal_if_present
  sleep 1
  find(".header-nav-top_row").click_link shop_link
end

Given("I login to Shop as a {string} user") do |user_type|
  user = case user_type
         when "Military"       then FigNewton.shop_users.military
         end

  @ShopLandingPage.sign_in(user, FigNewton.shop_users.general_password)
end

Given(/^Cash Back Activity Tab should be selected$/) do
  expect(@CashBack_PurchasesPage.cash_back_activity_tab_selected).to be(true)
end

Given(/^I check Summary Info Card existence$/) do
  expect(@CashBack_PurchasesPage.cash_back_summary_section.visible?).to be(true)
end

Given(/^I check Next Payment Info Card existence$/) do
  expect(@CashBack_PurchasesPage.next_payment_summary_section.visible?).to be(true)
end

Given(/^I check Purchases Table existence$/) do
  expect(@CashBack_PurchasesPage.purchase_table_section.visible?).to be(true)
end

Given(/^I check Purchases Table content$/) do
  expect(@CashBack_PurchasesPage.check_purchases_made).to be(true)
end


Given(/^I create a shop purchase with cash back for the user$/) do
  @ShopCashBackPage.create_cash_back_purchase(@offer_cms_admin.user_uid)
end


Given(/^I check that the cash back is displayed on the Summary Info Card$/) do
  expect(page).to have_css("div .column:nth-child(1) .cash",:text =>"$6.60")
end

Given(/^I check that the cash back is displayed on the Purchases Table$/) do
  expect(page).to have_css("#cash-back-purchases tbody td:nth-child(5)",:text =>"$6.60")
end

Given(/^I click on link to view My Cash$/) do
  @CashBack_PurchasesPage.click_on_my_cash
end

Given(/^I verify the new user email$/) do
  @CashBack_PurchasesPage.record_new_user_email
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
  expect(page.current_url).to eql(FigNewton.shop.merchant_page)
  find(".reviews").click
  expect(page).to have_css(".store-offers-list li:nth-child(1)",:text => FigNewton.shop.merchant_review_text)
end


Given(/^I check that payment settings dashboard is visible$/) do
  expect(page).to have_css(".dashboard__payment-info")
  expect(page).to have_css(".dashboard__payment-info .title",:text =>"We need some information to send your future cash back payments!")
  expect(page).to have_css(".dashboard__payment-info .button",:text =>"Update Payment Settings")
end

Given(/^I check the payment settings modal$/) do
  @CashBack_PurchasesPage.click_update_payment_settings_dashboard_button
  expect(page).to have_css(".modal-title",:text => "Update Your Payment Information")
  expect(page).to have_css(".modal-body",:text => "Receive Payment Through PayPal\nTo receive your cash back payments you will need a PayPal account.\nPlease enter your PayPal email below:\nPayPal Email")
  @CashBack_PurchasesPage.update_paypal_email
  expect(page).to have_css("#user_paypal_account-error",:text => "This field is required.")
  find(".close").click
end

Given(/^I update my payment information to receive via Paypal$/) do
  @CashBack_PurchasesPage.click_update_payment_settings_dashboard_button
  expect(page).to have_css(".heading.-smallest.-snug",:text =>"Receive Payment Through PayPal")
  @CashBack_PurchasesPage.enter_paypal_email
  @CashBack_PurchasesPage.update_paypal_email

  expect(page).to have_css("div.-notice.alert",:text =>"Successfully updated payment information")
  expect(page).to have_css(".dashboard__payment-info img[alt='PayPal']")
end

Given(/^I incorrectly update my paypal account information and see a error message$/) do
  @CashBack_PurchasesPage.click_update_payment_settings_dashboard_button
  fill_in("user_paypal_account", with: "test@")
  @CashBack_PurchasesPage.update_paypal_email
  expect(page).to have_content "Please enter a valid email"
end
