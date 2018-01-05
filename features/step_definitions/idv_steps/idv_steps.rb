Given(/^I set the External Vendor Environment to "([^"]*)"$/) do |settings|
  @AdminTool.login_in_new_window
  step 'I visit "AdminSettings"'
  @AdminSettings.set_vendor_env(settings: settings)
  sleep 1
  close_current_browser
  use_last_browser_created
end

Given(/^I set up multi\-factor authentication$/) do
  @IDVComputer.set_up_multifactor
end

Given(/^I click on the verify by uploading driver's license link$/) do
  @IDVComputer.click_verify_drivers_license_link
end

Given(/^I "([^"]*)" using a mocked driver's license$/) do |action|
  @IDVComputer.verify(action: action)
end

Given(/^I should see the error message for identity verification "(.*?)"$/) do |expected_text|
  sleep 15
  (idv_error_message.should eq(expected_text)).should == true
end

Given("I {string} via phone using a mocked driver's license") do |action|
  @IDVPhone.verify(action: action)
end

