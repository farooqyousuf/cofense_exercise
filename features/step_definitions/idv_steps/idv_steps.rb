Given("I set the External Vendor Environment to {string}") do |settings|
  AdminTool.new.login_in_new_window
  step 'I visit "AdminSettings"'
  AdminSettings.new.set_vendor_env(settings: settings)
  sleep 1

  close_current_browser
  use_last_browser_created
end

Given("I set up multi-factor authentication") do
  @IDV.set_up_multifactor
end

Given("I click on the verify by uploading driver's license link") do
  @IDV.click_verify_drivers_license_link
end

Given("I {string} via computer using a mocked driver's license") do |action|
  @IDV.verify_with_computer(action: action)
end

Given("I should see the error message for identity verification {string}") do |expected_text|
  sleep 15
  idv_error_message.should eq(expected_text)
end

Given("I {string} via phone using a mocked driver's license") do |action|
  @IDV.verify_with_phone(action: action)
end

Given("I click on the Take a picture with my phone link") do
  @IDV.click_take_pic_with_phone
  @IDV.enter_phone_number
  @IDV.click_send_me_link
  sleep 1
  @IDV.click_upload_form_link
  sleep 1
  use_last_browser_created
end

Given("I click on the Upload from my computer link") do
  @IDV.click_upload_from_computer
end

Given("I trigger KBA after failed documentation for IDV via computer") do
  step 'I "fail documentation" via computer using a mocked driver\'s license'
  sleep 30
  step 'I click on "Try another image"'
  step 'I click on "Upload from my computer"'

  step 'I "fail documentation" via computer using a mocked driver\'s license'
  sleep 40
  step 'I click on "Try another method"'
end

Given("I trigger KBA after failed documentation for IDV via phone") do
  step 'I "fail documentation" via phone using a mocked driver\'s license'
  sleep 30
  step 'I click on "Try another image"'
  step 'I click on the Take a picture with my phone link'

  step 'I "fail documentation" via phone using a mocked driver\'s license'
  sleep 40
  step 'I click on "Try another method"'
end

Given("I {string} via KBA") do |action|
  @IDV.verify_with_kba(action: action)
end
