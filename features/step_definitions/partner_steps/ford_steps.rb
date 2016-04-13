Given(/^ford \- I visit the Military Integration Page$/) do
  visit "https://www.fordsalutesthosewhoserve.com/"
end

Given(/^ford \- I sign in with IDP$/) do
  new_window = window_opened_by { find(".register").click }

  within_window new_window do
    sign_in_with_idme
  end
end

Given(/^ford \- I verify the Troop ID Integration for inactive member$/) do
  page.has_text? "Thank you for your service! We see you are a Veteran but need a little more information in order for you to receive the offer. Did you leave active duty after September 30, 1985?"

  click_on "Yes"

  verify_idme = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.window(verify_idme)
  sleep 2
  expect(page.driver.browser.current_url).to have_text "https://verify.id.me/military/"
end

Given(/^ford \- I visit the First Responder Integration Page$/) do
 visit "https://www.fordspecialoffer.com/firstresponders"
end

Given(/^ford \- I verify the First Responder Integration$/) do
 select("Ford",:from =>"lstIntBrand")

 expect(page.driver.browser.current_url).to have_text "https://www.fordspecialoffer.com/firstresponders/Register/EnrollFord"
 page.has_text? "First Responder Appreciation Bonus Cash"
end
