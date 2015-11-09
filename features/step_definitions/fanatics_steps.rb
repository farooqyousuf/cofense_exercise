Given(/^I add an item to the cart \("([^"]*)"\)$/) do |brand|
  case brand
    when "FAN"
      url = FigNewton.partners.fanatics
    when "NFL"
      url = FigNewton.partners.nfl_shop
  end

  visit url
  fanatics_lightbox(brand)
  click_link('Choose Size S')
  find('#addToCart').click

end

Given(/^I apply the Troop ID discount \("([^"]*)"\)$/) do |brand|
  click_link("militaryAndFirstResponderHeaderTitle")
  new_window = window_opened_by { find(".desktopIdMeMilitaryBtn").click }

  within_window new_window do
    sign_in_with_idme
  end
end

Given(/^I verify the Troop ID discount has been applied \("([^"]*)"\)$/) do |brand|
  case brand
  when "FAN"
    #need something unique to fanatics
  when "NFL"
    save_and_open_page
    expect(page.body).to have_content("A discount of 15% and free shipping was successfully applied to your order.")
  end

  Capybara.ignore_hidden_elements = false
  expect(find("#desktopIdStatus").text).to eq("Status Verified")
  Capybara.ignore_hidden_elements = true

end
