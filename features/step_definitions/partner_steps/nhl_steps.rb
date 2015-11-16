Given(/^NHL \- I add a item to the cart$/) do
  visit FigNewton.partners.nhl_shop
  click_link "Choose Size S"
  find("#addToCart").click
end

Given(/^NHL \- I apply the Troop ID discount$/) do
  click_link "militaryAndFirstResponderHeaderTitle"
  new_window = window_opened_by { find(".desktopIdMeMilitaryBtn").click }

  within_window new_window do
    sign_in_with_idme
  end
end

Given(/^NHL \- I verify the Troop ID discount has been applied$/) do
  page.has_text? "Status Verified"
end
