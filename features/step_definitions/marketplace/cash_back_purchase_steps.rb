
Given(/^I GET MP_User info for "([^"]*)"$/) do |user|
  case user
  when "vip_uid"
    @user_level = MarketplaceCashBackPage.new
    @user_level_response = @user_level.request_vip_uid
  end
end

Given(/^I check the "([^"]*)" user level is "([^"]*)"$/) do |user, level|
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
         when "Military"       then FigNewton.mp_users.vip
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
