Given("I submit dupe identity verification attempt via kba") do
  step 'I clear the session from Authority'
  step 'I visit IDP through the "au10tix_light" policy'
  step 'I click on the Sign Up link'
  step 'I sign up as a new user'
  step 'I click on "Verify by answering questions"'
  step 'I "submit dupe attempt" via KBA'
end

Given("I {string} via KBA") do |action|
  @IDVKba.verify_via_kba(action: action)
end
