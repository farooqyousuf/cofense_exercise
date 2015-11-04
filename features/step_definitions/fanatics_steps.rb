
Given(/^I add an item to the cart \("([^"]*)"\)$/) do |brand|
  case brand
    when "FAN" then element = "a", url = FigNewton.partners.fanatics
    when "NFL" then element = "button", url = FigNewton.partners.nfl_shop

  visit url
  fanatics_lightbox(brand)
  click_link('Choose Size S')
  find('#addToCart').click

end

Given(/^I apply the Troop ID discount \("([^"]*)"\)$/) do |brand|
  click_link("militaryAndFirstResponderHeaderTitle")
  new_window = window_opened_by { click_link("imgMilitary") }

  within_window new_window do
    sign_in_with_idme
  end
end

Given(/^I verify the Troop ID discount has been applied \("([^"]*)"\)$/) do |brand|
  Capybara.ignore_hidden_elements = false
  expect(find("#desktopIdStatus").text).to eq("Status Verified")
  Capybara.ignore_hidden_elements = true
end
