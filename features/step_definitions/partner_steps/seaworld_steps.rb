Given(/^I visit the waves of honor seaworld site$/) do
  visit "http://seaworldparks.com/seaworld-orlando/waves-of-honor/active/"
end

Given(/^I log in with my ID\.me military account$/) do
  idme_window = window_opened_by do
    find(".IDmeLoginButton").click
  end

  within_window idme_window do
    sign_in_with_idme
  end
end

Given(/^I verify access to discounted tickets$/) do
  expect(page).to have_content("Military Ticket Offers")
  expect(page).to have_content("Thank you for your service. Please see all offers available for you below.")
end
