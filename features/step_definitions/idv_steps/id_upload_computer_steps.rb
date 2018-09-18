Given("I {string} via computer using a mocked driver's license") do |action|
  sleep 10
  @IDVComputer.verify(action: action)
  sleep 10
end

Given("I trigger KBA after failed documentation for IDV via computer") do
  step 'I "fail documentation" via computer using a mocked driver\'s license'
  sleep 30
  step 'I click on "Try another image"'
  step 'I click on "Upload from my device"'

  step 'I "upload front doc" via computer using a mocked driver\'s license'
  sleep 40
  step 'I click on "Try another method"'
end

Given("I {string} via KBA") do |action|
  @IDVComputer.verify_via_kba(action: action)
end

Given("I submit dupe identity verification attempt via computer") do
  step 'I clear the session from Authority'
  step 'I visit IDP through the "au10tix_light" policy'
  step 'I click on the Sign Up link'
  step 'I sign up as a new user'
  step 'I click on "Verify using my driver\'s license"'
  step 'I click on "Upload from my device"'
  step 'I generate a unique "png" doc'
  step 'I "submit dupe attempt" via computer using a mocked driver\'s license'
end

Given("I edit {string} info via computer") do |fields|
  @IDVComputer.edit_info(fields)
end
