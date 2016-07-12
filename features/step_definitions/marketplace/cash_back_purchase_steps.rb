Given(/^I check the "([^"]*)" user level is "([^"]*)"$/) do |user, level| #TODO: switch this to a military affinity check
  case user
  when "vip_uid"
    expect(@user_level_response).to eql(level)
  end
end 

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

Given(/^I check Summary Info Card content$/) do
  cash_back_quarter = ((Time.now.month - 1) / 3) + 1
  case cash_back_quarter
  when "1"
    expect(@marketplace_my_cash_page.cash_back_summary_section.text).to eq("Cash Back\n$#{JSON.parse($last_response.body)["cash_back_current_quarter"]}\nEarnings from January 1 - March 31\nLifetime Cash Back\n$#{JSON.parse($last_response.body)["cash_back_lifetime"]}")
  when "2"
    expect(@marketplace_my_cash_page.cash_back_summary_section.text).to eq("Cash Back\n$#{JSON.parse($last_response.body)["cash_back_current_quarter"]}\nEarnings from April 1 - June 30\nLifetime Cash Back\n$#{JSON.parse($last_response.body)["cash_back_lifetime"]}")
  when "3"
    expect(@marketplace_my_cash_page.cash_back_summary_section.text).to eq("Cash Back\n$#{JSON.parse($last_response.body)["cash_back_current_quarter"]}\nEarnings from July 1 - September 30\nLifetime Cash Back\n$#{JSON.parse($last_response.body)["cash_back_lifetime"]}")
  when "4"
    expect(@marketplace_my_cash_page.cash_back_summary_section.text).to eq("Cash Back\n$#{JSON.parse($last_response.body)["cash_back_current_quarter"]}\nEarnings from October 1 - December 31\nLifetime Cash Back\n$#{JSON.parse($last_response.body)["cash_back_lifetime"]}")
  end
end

Given(/^I check Next Payment Info Card existence$/) do
  expect(@marketplace_my_cash_page.next_payment_summary_section.visible?).to be(true)
end

Given(/^I check Next Payment Info Card content$/) do
  payment_amount = JSON.parse($last_response.body)["cash_back_current_quarter"].to_i + JSON.parse($last_response.body)["cash_back_previous_quarter"].to_i
  cash_back_quarter = ((Time.now.month - 1) / 3) + 1
  case cash_back_quarter
  when "1"
    expect(@marketplace_my_cash_page.next_payment_summary_section.text).to eq("Amount\n$#{payment_amount}\n  Payment Date\nMay 1")
  when "2"
    expect(@marketplace_my_cash_page.next_payment_summary_section.text).to eq("Amount\n$#{payment_amount}\n  Payment Date\nAugust 1")
  when "3"
    expect(@marketplace_my_cash_page.next_payment_summary_section.text).to eq("Amount\n$#{payment_amount}\n  Payment Date\nNovember 1")
  when "4"
    expect(@marketplace_my_cash_page.next_payment_summary_section.text).to eq("Amount\n$#{payment_amount}\n  Payment Date\nFebruary 1")
  end
end

Given(/^I check Purchases Table existence$/) do
  expect(@marketplace_my_cash_page.purchase_table_section.visible?).to be(true)
end

Given(/^I check Purchases Table content$/) do
  expect(@marketplace_my_cash_page.check_purchases_made).to be(true)
end

Given(/^I find the user uid in offerCMS$/) do
  @offer_cms_admin = OfferCMSTool.new
  @offer_cms_admin.login_in_new_window
  @offer_cms_admin.find_user_uid(@username)
  @offer_cms_admin.logout_in_new_window 
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

Given(/^I check that the Cash Back purchase can be reviewed$/) do
  step 'I find the user uid in offerCMS'
  step 'I create a marketplace purchase with cash back for the user'
  page.driver.browser.navigate.refresh
  expect(page).to have_css("#cash-back-purchases tbody td:nth-child(6)",:text =>"Write Review")
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
  expect(page).to have_css(".dashboard__payment-info")
  expect(page).to have_css(".dashboard__payment-info .title",:text =>"We need some information to send your future cash back payments!")
  expect(page).to have_css(".dashboard__payment-info .button",:text =>"Update Payment Settings")
end

Given(/^I check the payment settings modal$/) do
  find(".dashboard__payment-info .button").click 
  expect(page).to have_css(".modal-header",:text => "Update Your Payment Information Confirm your information below for future cash back payments!")
  expect(page).to have_css(".payment-option-radios span:nth-child(1)",:text =>"PayPal")
  expect(page).to have_css(".payment-option-radios span:nth-child(2)",:text =>"Amazon.com Gift Card")
  expect(page).to have_css(".modal-block input[value='Update Payment Settings']")
end

Given(/^I update my payment information to receive via Amazon gift card$/) do
  find(".payment-option-radios span:nth-child(2)").click 
  expect(page).to have_css(".payment-option-radios span:nth-child(2)[class='active']")
  find(".modal-block input[value='Update Payment Settings']").click 
  expect(page).to have_css(".alert",:text => "Successfully updated payment information") 
end

Given(/^I update my payment information to receive via Paypal$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I incorrectly update my paypal account information and see a error message$/) do
  pending # Write code here that turns the phrase above into concrete actions
end


