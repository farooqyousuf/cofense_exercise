Given(/^I create a Teacher Lookup page object$/) do
  @TeacherLookup = TeacherLookup.new
end

Given(/^I click on the verify using teacher state lookup link$/) do
  @TeacherLookup.click_verify_by_state_lookup
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
