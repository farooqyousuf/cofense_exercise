Given(/^I visit the waves of honor "([^"]*)" Integration$/) do |park_partner|
  seaworld_promotion_homepage = case park_partner
    when "Seaworld Orlando"           then FigNewton.partners.seaworld.orlando 
    end 
  visit seaworld_promotion_homepage
end

Given(/^I log in with my Id\.me military account$/) do
  idp_signin = window_opened_by do
    find(".IDmeLoginButton").click
  end

  within_window idp_signin do
    sign_in_with_idme
  end
end

Given(/^I verify that my discounted tickets are available$/) do
  full_price = find(".tagName").find("strike").text 
  actual_price = first(".content-maincontent-ticketbox-tixchoose-inner").find(".dynPrice").text
  discount_applied = verify_discount(full_price, actual_price, ".5",exact_match: true)

  expect(discount_applied).to be(true)
end
