Given("I create a Student Doc page object") do
  @StudentDoc = StudentDoc.new
end

Given("I verify using student documentation") do
  step 'I generate a unique "png" doc'
  @StudentDoc.verify(type: "unique")
end

Given("I submit the student doc upload verification form as a {string} record") do |type|
  @StudentDoc.verify(type: type)
end

Given("I click on the Verify by uploading documentation link") do
  @StudentDoc.click_verify_by_doc
end

Given("I submit the Canadian student verification form as a {string} record") do |type|
  step 'I generate a unique "png" doc'
  @StudentCanada.verify(type: type)
end
