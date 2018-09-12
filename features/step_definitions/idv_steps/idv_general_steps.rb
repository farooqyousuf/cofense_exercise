Given("I click on the verify by uploading driver's license link") do
  @IDVComputer.click_verify_drivers_license_link
end

Given("I should see the error message for identity verification {string}") do |expected_text|
  sleep 15
  idv_error_message.should eq(expected_text)
end

Given("I verify the identity verification document submit button is disabled") do
  expect(page).to have_css("input[data-disable-with='Look Good?'][type='submit']") #Should have Disabled Submit Button
  expect(page).not_to have_css("input[data-disable-with='Please wait ...'][type='submit']") #Should not have Enabled Submit Button
  expect(page).to have_css("#sr_page_title", :text => "Upload your driver's license")
  expect(page).to have_css("div.photos-container:nth-child(1) > a > span", :text => "Upload photo of license front")
  expect(page).to have_css("div.photos-container:nth-child(2) > a > span", :text => "Upload photo of license back")
  expect(page).not_to have_css("#sr_page_title", :text => "Enter your phone number")
end

Given("I submit empty identity verification form for smartphone") do
  @IDVComputer.submit_empty_smartphone_number_form
end

Given("I submit empty identity verification form for homephone") do
  @IDVComputer.submit_empty_homephone_number_form
end

Given("I submit identity verification phone number form") do
  @IDVComputer.click_smartphone_with_browser_option
  @IDVComputer.enter_phone_number
  @IDVComputer.submit_phone_number
end

Given("I submit empty identity verification form for ssn") do
  @IDVComputer.submit_empty_ssn_form
  expect(page).to have_css(".error")
end
