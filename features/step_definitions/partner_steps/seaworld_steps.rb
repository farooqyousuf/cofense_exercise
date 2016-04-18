Given(/^I visit the waves of honor seaworld site$/) do
  visit FigNewton.partners.seaworld_url
end

Given(/^I log in with my ID\.me military account$/) do
  idp_signin = window_opened_by do
    find(".IDmeLoginButton").click
  end

  within_window idp_signin do
    sign_in_with_idme
  end
end

Given(/^I verify access to discounted tickets$/) do
  #TODO: trouble having capybara select tickets but need to proceed through whole checkout and confirm 
  page.has_text? "Military Ticket Offers"
  page.has_text? "Thank you for your service. Please see all offers available for you below."
  expect(find(".tagName").text).to eql("SeaWorld Orlando 2016 Fun Card Price: $99.00 $49.50")
end
