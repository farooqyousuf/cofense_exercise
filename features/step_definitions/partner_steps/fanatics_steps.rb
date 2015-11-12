Given(/^I add an item to the cart \("([^"]*)"\)$/) do |brand|
  case brand
  when "FAN"
    url = FigNewton.partners.fanatics
  when "NFL"
    url = FigNewton.partners.nfl_shop
  end

  visit url
  if brand == "FAN"
    visit "http://www.fanatics.com/NFL_New_England_Patriots_Mens/Mens_Nike_Tom_Brady_Navy_Blue_Silver_New_England_Patriots_Game_Jersey"
  end
  if page.has_link?("lightboxSaleCloseLink") || page.has_link?("lightboxSaleCloseLinkMM")
    fanatics_lightbox(brand)
  end
  click_link "Choose Size S"
  find("#addToCart").click
end

Given(/^I apply the Troop ID discount \("([^"]*)"\)$/) do |brand|
  click_link "militaryAndFirstResponderHeaderTitle"
  new_window = window_opened_by { find(".desktopIdMeMilitaryBtn").click }

  within_window new_window do
    sign_in_with_idme
  end
end

Given(/^I verify the Troop ID discount has been applied \("([^"]*)"\)$/) do |brand|
  case brand
  when "FAN"
    # need something unique to fanatics
  when "NFL"
    expect(find(".ui-alert-body").text).to eql("A discount of 15% and free shipping was successfully applied to your order.")
  end

  Capybara.ignore_hidden_elements = false
  expect(find("#desktopIdStatus").text).to eq("Status Verified")
  Capybara.ignore_hidden_elements = true
end
