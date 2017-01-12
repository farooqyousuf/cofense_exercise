Given(/^ford \- I visit the Military Integration Page$/) do
  visit "https://www.fordsalutesthosewhoserve.com/"
  fill_in("ZipCode",:with =>"22066")
  find("#buttonGeneral:nth-child(2)").click
end

Given(/^ford \- I sign in with IDP$/) do
  new_window = window_opened_by { find(".register").click }

  within_window new_window do
    sign_in_with_idme
  end
end


Given(/^ford \- I visit the First Responder Integration Page$/) do
 visit "https://www.fordspecialoffer.com/firstresponders"
 fill_in("ZipCode",:with =>"22066")
 find("#buttonGeneral1").click
end

Given(/^ford \- I verify the First Responder Integration$/) do
 select("Ford",:from =>"lstIntBrand")
 expect(page.driver.browser.current_url).to have_text "https://www.fordspecialoffer.com/firstresponders/Register/EnrollFord"
 page.has_text? "First Responder Appreciation Bonus Cash"
end

Given(/^ford \- I sign in with IDP as military member$/) do
  new_window = window_opened_by { find(".register").click }

  within_window new_window do
    sign_in_with_idme
  end
end

Given(/^ford \- I verify the Troop ID Integration for military member$/) do
  select("Ford",:from =>"lstIntBrand")
  click_on "Submit"
  sleep 1
  expect(page.driver.browser.current_url).to have_text "https://www.fordsalutesthosewhoserve.com/Register/EnrollFord"
  page.has_text? "Military Appreciation Bonus Cash"
end

