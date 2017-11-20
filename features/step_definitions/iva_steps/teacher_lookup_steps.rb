Given(/^I create a Teacher Lookup page object$/) do
  @TeacherLookup = TeacherLookup.new
end

Given(/^I click on the verify using teacher state lookup link$/) do
  @TeacherLookup.click_verify_by_state_lookup
end

Given(/^I verify using teacher credentials with "([^"]*)"$/) do |method|
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

Given(/^I submit the teacher lookup verification form as a "([^"]*)" record$/) do |type|
  @TeacherLookup.verify(type: type)
end

Given(/^I "([^"]*)" the teacher verification in IDme admin$/) do |action|
  @AdminTool.login_in_new_window

  step 'I visit "AdminTeacherVerifs"'
  if action == "approve"
    @AdminTeacherVerifs.approve_doc
    @AdminTool.logout_in_new_window
  elsif action == "deny"
    @AdminTeacherVerifs.deny_doc
    @AdminTool.logout_in_new_window
  else fail('Action "#{action}" is not defined in step')
  end
end

Given(/^I reload the group affiliations page$/) do
  visit 'https://shop-staging.idmeinc.net/'
  first('.nav-tabs').click_on('Wallet')
  first('.nav-tabs').click_on('Shop')
  click_on "Verify to Save"
end
