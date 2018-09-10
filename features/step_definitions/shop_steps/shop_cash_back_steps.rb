Given("I click on the Shop {string} navigation link") do |shop_link|
  @ShopLandingPage.close_out_modal_if_present
  sleep 1
  find(".header-nav-top_row").click_link shop_link
end

Given("I login to Shop as a {string} user") do |user_type|
  user = case user_type
         when "Military"       then FigNewton.shop_users.military
         end

  @ShopLandingPage.sign_in(user, FigNewton.shop_users.general_password)
end

Given("I verify that the {string} tab is selected") do |tab|
  expect(@ShopCashBackPage.selected_tab(tab)).to be(true)
end

Given("I confirm the cash back summary section is shown") do
  expect(@ShopCashBackPage.cash_back_summary_section.visible?).to be(true)
end

Given("I confirm the next payment section is shown") do
  expect(@ShopCashBackPage.next_payment_summary_section.visible?).to be(true)
end

Given("I confirm the purchases table is shown") do
  expect(@ShopCashBackPage.purchase_table_section.visible?).to be(true)
end

Given("I verify the purchases table content for purchases made") do
  expect(@ShopCashBackPage.check_purchases_made).to be(true)
end

Given("I click on the Payment History tab") do
  @ShopCashBackPage.click_on_payment_history
end

Given("I click on link to view My Cash") do
  @ShopCashBackPage.click_on_my_cash
end

Given("I verify the new user email") do
  @ShopCashBackPage.record_new_user_email
end

Given("I confirm that the payment settings dashboard is shown") do
  expect(page).to have_css(".dashboard__payment-info")
  expect(page).to have_css(".dashboard__payment-info .title",:text =>"We need some information to send your future cash back payments!")
  expect(page).to have_css(".dashboard__payment-info .button",:text =>"Update Payment Settings")
end

Given("I verify the content within the payment settings modal") do
  @ShopCashBackPage.click_update_payment_settings_dashboard_button
  expect(page).to have_css(".modal-title",:text => "Update Your Payment Information")
  expect(page).to have_css(".modal-body",:text => "Receive Payment Through PayPal\nTo receive your cash back payments you will need a PayPal account.\nPlease enter your PayPal email")
  @ShopCashBackPage.update_paypal_email
  expect(page).to have_css("#user_paypal_account-error",:text => "This field is required.")
  find(".close").click
end

Given("I update my payment information to receive via Paypal") do
  @ShopCashBackPage.click_update_payment_settings_dashboard_button
  expect(page).to have_css(".heading.-smallest.-snug",:text =>"Receive Payment Through PayPal")
  @ShopCashBackPage.enter_paypal_email
  @ShopCashBackPage.update_paypal_email
end

Given("I verify my payment information information was successfully updated") do
  expect(page).to have_css(".alert > div",:text =>"Successfully updated payment information")
  expect(page).to have_css(".dashboard__payment-info img[alt='PayPal']")
end

Given("I update my paypal account with an invalid paypal email") do
  @ShopCashBackPage.click_update_payment_settings_dashboard_button
  fill_in("user_paypal_account", with: "test@")
  @ShopCashBackPage.update_paypal_email
end

Given("I see an error message for invalid paypal email") do
  expect(page).to have_content "Please enter a valid email"
end

Given("I check that the cash back is displayed on the Summary Info Card") do
  expect(page).to have_css("div .column:nth-child(1) .cash",:text =>"$6.60")
end

Given("I check that the cash back is displayed on the Purchases Table") do
  expect(page).to have_css("#cash-back-purchases tbody td:nth-child(5)",:text =>"$6.60")
end

Given("I create a review for the Cash Back purchase") do
  page.execute_script "window.scrollBy(0,1000)"
  find(".button",:text => "Write Review").click
  find(".review_rating i:nth-child(4)").click
  fill_in("review_name",:with =>"William Wallace")
  click_button "Submit Review"
  expect(page).to have_css(".alert", :text =>"Successfully reviewed Fanatics")
end

Given("I check that the review is displayed on the merchant page") do
  #redirects to fanatics page
  expect(page.current_url).to eql(FigNewton.shop.merchant_page)
  find(".reviews").click
  expect(page).to have_css(".store-offers-list li:nth-child(1)",:text => FigNewton.shop.merchant_review_text)
end


## Mobile Shop Steps
Given("I click on the Shop mobile {string} navigation link") do |shop_link|
  @ShopLandingPage.close_out_modal_if_present
  find(".header-nav-menu").click
  page.has_css? ".sidenav-mini-departments" #waits until menu is shown until next method is run
  @ShopLandingPage.scroll_to_bottom_of_sidenav_menu
  click_link(shop_link)
end
