Given(/^UBER \- I visit the UBER hosted landing page$/) do
 visit FigNewton.partners.uber_hlp
end

Given(/^UBER \- I sigin in with my IDme military account$/) do
  idp_signin = window_opened_by do
    find(".idme-trigger").click
  end

  within_window idp_signin do
    sign_in_with_idme
  end
end

Given(/^UBER \- I confirm my IDme military account has been verified$/) do
  expect(page).to have_current_path("/ubermilitary-driver-partner-verification/offer?scope=military")
  expect(page).to have_css("#Field9[value='#{FigNewton.partners.user}']")
  expect(page).to have_css(".description",:text =>"You've successfully verified your military affiliation. Please click \"Submit\" below and we'll let Uber know you are now verified for any upcoming UberMILITARY incentives and promotions.")
  expect(page).to have_css(".form-header img[alt='Uber']")
end
