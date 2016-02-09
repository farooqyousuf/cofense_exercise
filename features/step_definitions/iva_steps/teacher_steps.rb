Given(/^I should be on the teacher verification screen$/) do
  @teacher_doc = TeacherDoc.new
  find(@teacher_doc.header_css).visible?
end

Given(/^I verify using teacher documentation$/) do
  @teacher_doc = TeacherDoc.new
  @teacher_doc.verify
end