Given(/^ford \- I go to the ford military appreciation program$/) do
  visit "https://www.fordsalutesthosewhoserve.com/"
end

Given(/^ford \- I register through the Troop ID Integration$/) do
  new_window = window_opened_by { find(".register").click }

  within_window new_window do
    sign_in_with_idme
  end
end

Given(/^ford \- I verify the Troop ID Integration for invalid service member$/) do
  page.has_text? "Thank you for your service! We see you are a Veteran but need a little more information in order for you to receive the offer. Did you leave active duty after September 30, 1985?"

  click_on "Yes"

  verify_idme = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.window(verify_idme)

  expect(page.driver.browser.current_url).to have_text "https://verify.id.me/military/"
end
