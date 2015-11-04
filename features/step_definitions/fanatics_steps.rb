
Given(/^I add an item to the cart \("([^"]*)"\)$/) do |brand|
  case brand
    when "FAN" then element = "a", url = FigNewton.partners.fanatics
    when "NFL" then element = "button", url = FigNewton.partners.nfl_shop #check if this is still valid
  end

  visit url
  Capybara.default_max_wait_time = 3 #originally Watir(sleep 2) might now need this
  fanatics_lightbox(brand)

  click_link('Choose Size S')
  find('#addToCart').click
  Capybara.default_max_wait_time = 3

end

Given(/^I apply the Troop ID discount \("([^"]*)"\)$/) do |brand|
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I verify the Troop ID discount has been applied \("([^"]*)"\)$/) do |brand|
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I apply the First Responder discount \("([^"]*)"\)$/) do |brand|
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I verify the First Responder discount has been applied \("([^"]*)"\)$/) do |brand|
  pending # Write code here that turns the phrase above into concrete actions
end
