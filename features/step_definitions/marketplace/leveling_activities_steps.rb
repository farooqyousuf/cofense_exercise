Given(/^I click on Username link$/) do
  @marketplace_shop.click_on_user_profile_navigation_link
end

Given(/^The page url should be the CashBack Page$/) do
  expect(@marketplace_shop.user_cashback_page_url).to eql(FigNewton.marketplace.user_cashback_profile_url)
end

Given(/^I get the "([^"]*)" user achievements progress$/) do |user_level|
  case user_level
  when "vip_uid"
    @user_achievement_progress = @marketplace_shop.request_vip_achievements
  end
end

Given(/^I check the Connect Your Facebook activity card$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I Connect My Facebook Account$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I should see successful flash message with "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I get the "([^"]*)" user achievements progress after I connected My Facebook Account$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I check the Connect Your Facebook activity card after I connected My Facebook Account$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^The notifications popover list should have "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end
