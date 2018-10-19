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

Given("I submit empty kba {string} form") do |form|
  @IDVKba.submit_form
end

Given("I submit personal information form via kba") do
  @IDVKba.submit_personal_info_form
end

Given("I submit address information form via kba") do
  @IDVKba.submit_address_info_form
end

Given("I should see an error on kba questions") do
  all(".radio").map do |q|
    expect(q["class"]).to eql("field radio error")
  end
end

Given("I answer the KBA questions") do
  @KBAQuestions.answer_questions
  @IDVKba.submit_form
end
