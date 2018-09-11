Given("I create a Teacher Lookup page object") do
  @TeacherLookup = TeacherLookup.new
end

Given("I click on the verify using teacher state lookup link") do
  @TeacherLookup.click_verify_by_state_lookup
end

Given("I verify using teacher credentials with {string}") do |method|
  case method
  when "no license and no ssn"
    @TeacherLookup.verify(state: "Delaware")
  when "no license and short ssn"
    @TeacherLookup.verify(state: "New Mexico")
  when "license and no ssn"
    @TeacherLookup.verify(state: "Michigan")
  when "license and short ssn"
    @TeacherLookup.verify(state: "Alabama")
  end
end

Given("I submit the teacher lookup verification form as a {string} record") do |type|
  @TeacherLookup.verify(type: type)
end
