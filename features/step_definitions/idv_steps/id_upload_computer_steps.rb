Given("I {string} via computer using a mocked driver's license") do |action|
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
