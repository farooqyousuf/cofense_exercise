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

#facebook

Given(/^I check the Connect Your Facebook activity card$/) do
  expect(@marketplace_shop.social_network_activity_card_exists("facebook")).to be(true)
  @marketplace_shop.check_facebook_activity_card_connected
end

Given(/^I Connect My Facebook Account$/) do
  @marketplace_shop.social_network_login("facebook")
end

Given(/^I should see successful flash message with "([^"]*)"$/) do |success_text|
  expect(@marketplace_shop.success_flash_msg(success_text)).to be(true)
end

Given(/^I get the "([^"]*)" user achievements progress after I connected My Facebook Account$/) do |user_level|
  case user_level
  when "vip_uid"
    @user_achievement_progress_post = @marketplace_shop.request_vip_achievements
  end

  expect(@user_achievement_progress_post[1]["completed"]).to be(true)
end

Given(/^I check the Connect Your Facebook activity card after I connected My Facebook Account$/) do
  @marketplace_shop.check_facebook_activity_card_connected
end

#twitter

Given(/^I check the Connect Your Twitter Account activity card$/) do
  expect(@marketplace_shop.social_network_activity_card_exists("twitter")).to be(true)
  @marketplace_shop.check_twitter_activity_card_connected
end

Given(/^I Connect My Twitter Account$/) do
  @marketplace_shop.social_network_login("twitter")
end

Given(/^I get the "([^"]*)" user achievements progress after I connected My Twitter Account$/) do |user_level|
  case user_level
  when "vip_uid"
    @user_achievement_progress_post = @marketplace_shop.request_vip_achievements
  end

  expect(@user_achievement_progress_post[19]["completed"]).to be(true)
end

Given(/^I check the Connect Your Twitter Account activity card after I connected My Twitter Account$/) do
  @marketplace_shop.check_twitter_activity_card_connected
end

#linkedin

Given(/^I check the Connect Your LinkedIn Account activity card$/) do
  expect(@marketplace_shop.social_network_activity_card_exists("linked-in")).to be(true)
  @marketplace_shop.check_linkedin_activity_card_connected
end

Given(/^I Connect My LinkedIn Account$/) do
  @marketplace_shop.social_network_login("linkedin")
end

Given(/^I get the "([^"]*)" user achievements progress after I connected My LinkedIn Account$/) do |user_level|
  case user_level
  when "vip_uid"
    @user_achievement_progress_post = @marketplace_shop.request_vip_achievements
  end

  expect(@user_achievement_progress_post[6]["completed"]).to be(true)
end

Given(/^I check the Connect Your LinkedIn Account activity card after I connected My LinkedIn Account$/) do
  @marketplace_shop.check_linkedin_activity_card_connected
end
