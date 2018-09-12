Given("I create a Teacher Doc page object") do
  @TeacherDoc = TeacherDoc.new
end

Given("I click on the teacher verify using documentation link") do
  @TeacherDoc.click_verify_by_doc
end

Given("I select the teacher state {string}") do |state|
  @TeacherDoc.select2_arrow(state)
  sleep 3
  if (page.has_content?("Verify using your teacher credentials") || ("Verify by uploading documentation")) == false
    @TeacherDoc.select2_arrow(state)
  end
end

Given("I verify using teacher documentation") do
  step 'I generate a unique "png" doc'
  @TeacherDoc.verify(type: "unique")
end

Given("I submit the teacher doc upload verification form as a {string} record") do |type|
  @TeacherDoc.verify(type: type)
end

Given("I submit the empty Teacher form using {string}") do |method|
  case method
  when "Teacher Document"
    @TeacherDoc.verify(populate: false)
  when "Teacher Lookup Delaware"
    @TeacherLookup.verify(state: "Delaware", populate: false)
  when "Teacher Lookup New Mexico"
    @TeacherLookup.verify(state: "New Mexico", populate: false)
  when "Teacher Lookup Michigan"
    @TeacherLookup.verify(state: "Michigan", populate: false)
  when "Teacher Lookup Alabama"
    @TeacherLookup.verify(state: "Alabama", populate: false)
  end
end
