Given("I click on the verify by uploading driver's license link") do
  @IDVComputer.click_verify_drivers_license_link
end

Given("I should see the error message for identity verification {string}") do |expected_text|
  sleep 15
  idv_error_message.should eq(expected_text)
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
end

Given("I submit identity verification ssn form") do
  @IDVComputer.enter_ssn
end

Given("I submit empty identity verification form for ssn") do
  @IDVComputer.submit_empty_ssn_form
  expect(page).to have_css(".error")
end

Given("I submit the edited info form") do
  @IDVComputer.check_fcra_box
  click_button("Verify my information")
end

Given("I submit the info form") do
  @IDVComputer.check_fcra_box
  click_button("Verify my information")
end

Given("I verify that {string} info was updated") do |fields|
  expect(@IDVComputer.current_info(fields)).not_to eql(@IDVComputer.mocked_info(fields)) unless "fields == Home Phone"
  expect(@IDVComputer.current_info(fields)).to eql(@IDVComputer.expected_info(fields))
end

Given("I verify updated identity verification info for {string}") do |type|
  @SupportTool.login_in_new_window
  @SupportToolVerificationAttempts.search_user_by_email(email_address: @user_email)
  @SupportToolVerificationAttempts.open_newest
  @IDVComputer.compare_expected_and_actual_user_property_values(type)
end

Given("I close current tab") do
  @IDmeBase.close_current_browser
  @IDmeBase.use_original_tab
end

Given("I edit {string} info") do |fields|
  @IDVComputer.edit_info(fields)
end
