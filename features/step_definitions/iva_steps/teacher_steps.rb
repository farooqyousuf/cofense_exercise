Given(/^I click on the teacher verify using state lookup link$/) do
  TeacherLookup.new.click_verify_by_state_lookup
end

Given(/^I click on the teacher verify using documentation link$/) do
  TeacherDoc.new.click_verify_by_doc
end

Given(/^I select the teacher state "([^"]*)"$/) do |state|
  TeacherDoc.new.populate_teacher_first_state(state)
end

Given(/^I should be on the teacher verification screen$/) do
  @teacher_doc = TeacherDoc.new
  find(@teacher_doc.header_css).visible?
end

Given(/^I verify using teacher documentation$/) do
  TeacherDoc.new.verify(type: "unique")
end

Given(/^I submit the teacher doc upload verification form as a "([^"]*)" record$/) do |type|
  TeacherDoc.new.verify(type: type)
end

Given(/^I submit the empty Teacher form using "([^"]*)"$/) do |method|

  @teacher_doc = TeacherDoc.new
  @teacher_lookup = TeacherLookup.new

  case method
  when "Teacher Document"
    @teacher_doc.verify(populate: false)
  when "Teacher Lookup Delaware"
    @teacher_lookup.verify(state: "Delaware", populate: false)
  when "Teacher Lookup New Mexico"
    @teacher_lookup.verify(state: "New Mexico", populate: false)
  when "Teacher Lookup Michigan"
    @teacher_lookup.verify(state: "Michigan", populate: false)
  when "Teacher Lookup Alabama"
    @teacher_lookup.verify(state: "Alabama", populate: false)
  end
end

Given(/^I verify using teacher credentials with "([^"]*)"$/) do |method|
  @teacher_lookup = TeacherLookup.new

  case method
  when "no license and no ssn"
    @teacher_lookup.verify()
  when "no license and short ssn"
    @teacher_lookup.verify(state: "New Mexico")
  when "license and no ssn"
    @teacher_lookup.verify(state: "Michigan")
  when "license and short ssn"
    @teacher_lookup.verify(state: "Alabama")
  end
end

Given(/^I submit the teacher lookup verification form as a "([^"]*)" record$/) do |type|
  TeacherLookup.new.verify(type: type)
end


Given(/^I "([^"]*)" the teacher verification in IDme admin$/) do |action|
  @admin_tool = AdminTool.new
  @admin_tool.login_in_new_window

  step 'I visit "AdminTeacherVerifs"'
  @admin_teacher_verifs = AdminTeacherVerifs.new

  if action == "approve"
    @admin_teacher_verifs.approve_doc
  else
    @admin_teacher_verifs.deny_doc
  end

  @admin_tool.logout_in_new_window
end
