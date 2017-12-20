Given(/^I set the External Vendor Environment to "([^"]*)" within the Admin tool$/) do |settings|
  @AdminTool.login
  step 'I visit "AdminSettings"'
  @AdminSettings.set_vendor_env(settings: settings)
  sleep 1
end

Given(/^I set up multi\-factor authentication$/) do
  @IDV.set_up_multifactor
end

Given(/^I click on the verify by uploading driver's license link$/) do
  @IDV.click_verify_drivers_license_link
end

Given(/^I verify using a mocked driver's license$/) do
  @IDV.verify
  @Consent.allow
end
