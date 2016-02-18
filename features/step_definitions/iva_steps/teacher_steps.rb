Given(/^I should be on the teacher verification screen$/) do
  @teacher_doc = TeacherDoc.new
  find(@teacher_doc.header_css).visible?
end

Given(/^I verify using teacher documentation$/) do
  @teacher_doc = TeacherDoc.new
  @teacher_doc.verify
end

Given(/^I submit the empty Teacher form using "([^"]*)"$/) do |method|
  @teacher_doc = TeacherDoc.new
  @teacher_lookup = TeacherLookup.new
  case method
  when "Teacher Document"
  	@teacher_doc.verify(false)
  when "Teacher Lookup Delaware"
    @teacher_lookup.verify("Delaware", false)
  end
end

Given(/^I verify using teacher credentials with "([^"]*)"$/) do |method|
	@teacher_lookup = TeacherLookup.new
	case method		
	when "no license and no ssn"
		@teacher_lookup.verify("Delaware")
	when "no license and short ssn"
		@teacher_lookup.verify("New Mexico")
	when "license and no ssn"
		@teacher_lookup.verify("Michigan")
	when "license and short ssn"
		@teacher_lookup.verify("Alabama")
	end
end

Given(/^I approve the teacher verification in IDme admin$/) do
  @admin_tool = AdminTool.new
  @admin_tool.login_in_new_window

  step 'I visit "AdminTeacherVerifs"'
  @admin_teacher_verifs = AdminTeacherVerifs.new

  @admin_teacher_verifs.approve_doc
  
  @admin_tool.logout_in_new_window
end