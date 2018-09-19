Given("I verify that the user was searched with {string} using the Support tool") do |type|
  @SupportTool.login_in_new_window
  @SupportTool.verify_search(type: type)
end

Given("I verify that the {string} was searched using the Support tool") do |type|
  @SupportTool.login_in_new_window
  @SupportTool.verify_search(type: type, user_email: @user_email)
end

Given("I verify that the new user is no longer found within the Support tool") do
  @SupportToolVerificationAttempts.search_user_by_email(email_address: @user_email)
  expect(page).not_to have_css(".odd > td", :text => @user_email)
end

Given("I update the {string} verification attempt within the IDme support tool") do |type|
  @SupportTool.login_in_new_window
  step 'I visit "SupportToolVerificationAttempts"'
  @SupportToolVerificationAttempts.open_newest
  @SupportToolEditAttempts.edit_attempt(type: type)
end

Given("I {string} values within the IDme support tool") do |type|
  @SupportTool.login_in_new_window
  step 'I visit "SupportToolVerificationAttempts"'
  @SupportToolVerificationAttempts.open_newest
  @SupportToolEditAttempts.edit_attempt(type: type)
end

Given("I verify the updated {string} verification attempt within the IDme support tool") do |type|
  step 'I visit "SupportTool"'
  @SupportToolVerificationAttempts.search_user_by_email(email_address: @user_email)
  @SupportToolVerificationAttempts.view_searched_user_verification_attempt
  @SupportToolEditAttempts.compare_expected_and_actual_user_property_values(type: type)
end

Given("I verify that the verification attempt shows errors for required fields") do
  expect(page).to have_css(".formError", :text => "can\'t be blank")
end
