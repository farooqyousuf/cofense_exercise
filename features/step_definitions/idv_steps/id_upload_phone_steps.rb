Given("I {string} via phone using a mocked driver's license") do |action|
  @IDVPhone.verify(action: action)
  sleep 10
end

Given("I click on the Take a picture with my phone link") do
  @IDVPhone.click_take_pic_with_phone
  @IDVPhone.enter_phone_number
  @IDVPhone.click_send_me_link
  sleep 1
  @IDVPhone.click_upload_form_link
  sleep 1
  use_last_browser_created
end

Given("I trigger KBA after failed documentation for IDV via phone") do
  step 'I "fail documentation" via phone using a mocked driver\'s license'
  sleep 30
  step 'I click on "Try another image"'
  step 'I click on the Take a picture with my phone link'

  step 'I "upload front doc" via phone using a mocked driver\'s license'
  sleep 40
  step 'I click on "Try another method"'
end

Given("I {string} KBA via phone") do |action|
  @IDVPhone.verify_with_kba(action: action)
end
