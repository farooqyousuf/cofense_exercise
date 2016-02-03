Given(/^I should be on the student verification screen$/) do
  @student_creds = StudentCreds.new
  find(@student_creds.header_css).visible?
end

Given(/^I verify using student credentials$/) do
  @student_creds = StudentCreds.new
  @student_creds.verify
end