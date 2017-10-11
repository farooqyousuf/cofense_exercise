Given(/^I click on the verify using teacher state lookup link$/) do
  @TeacherLookup.click_verify_by_state_lookup
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
    @TeacherDoc.verify(state: "Delaware", populate: false)
  when "Teacher Lookup New Mexico"
    @TeacherDoc.verify(state: "New Mexico", populate: false)
  when "Teacher Lookup Michigan"
    @TeacherDoc.verify(state: "Michigan", populate: false)
  when "Teacher Lookup Alabama"
    @TeacherDoc.verify(state: "Alabama", populate: false)
  end
end

Given(/^I verify using teacher credentials with "([^"]*)"$/) do |method|
  @TeacherLookup.click_licensed_by_state
  @TeacherLookup.select_licensed_by_state_de
  @TeacherLookup.click_begin

  case method
  when "no license and no ssn"
    @TeacherLookup.verify()
  when "no license and short ssn"
    @TeacherLookup.verify(state: "New Mexico")
  when "license and no ssn"
    @TeacherLookup.verify(state: "Michigan")
  when "license and short ssn"
    @TeacherLookup.verify(state: "Alabama")
  end
end

Given(/^I submit the teacher lookup verification form as a "([^"]*)" record$/) do |type|
  @TeacherLookup.verify(type: type)
end


Given(/^I "([^"]*)" the teacher verification in IDme admin$/) do |action|
  @AdminTool.login_in_new_window

  step 'I visit "AdminTeacherVerifs"'
  if action == "approve"
    @AdminTeacherVerifs.approve_doc
  else
    @AdminTeacherVerifs.deny_doc
  end

  @AdminTool.logout_in_new_window
  @TeacherLookup.click_continue
end
