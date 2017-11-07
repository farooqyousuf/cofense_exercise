Given(/^I create a Teacher Doc page object$/) do
  @TeacherDoc = TeacherDoc.new
end

Given(/^I click on the teacher verify using documentation link$/) do
  @TeacherDoc.click_verify_by_doc
end

Given(/^I select the teacher state "([^"]*)"$/) do |state|
  @TeacherDoc.populate_teacher_first_state(state)
end

Given(/^I should be on the teacher verification screen$/) do
  find(@TeacherDoc.header_css).visible?
  expect(page).to have_content "Teacher ID"
end

Given(/^I verify using teacher documentation$/) do
  @TeacherDoc.verify(type: "unique")
end

Given(/^I submit the teacher doc upload verification form as a "([^"]*)" record$/) do |type|
  @TeacherDoc.verify(type: type)
end

Given(/^I submit the empty Teacher form using "([^"]*)"$/) do |method|
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