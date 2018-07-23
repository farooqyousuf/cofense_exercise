Given("I click on the verify by uploading driver's license link") do
  @IDVComputer.click_verify_drivers_license_link
end

Given("I should see the error message for identity verification {string}") do |expected_text|
  sleep 15
  idv_error_message.should eq(expected_text)
end
