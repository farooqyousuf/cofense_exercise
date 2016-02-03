Given(/^I should be on the student verification screen$/) do
  @student_creds = StudentCreds.new
  find(@student_creds.header_css).visible?
end

Given(/^I verify using student credentials$/) do
  @student_creds = StudentCreds.new
  @student_creds.verify
end

Given(/^I submit the empty Student form using "([^"]*)"$/) do |method|
  case method
  when "Student Credentials"
  	@student_creds = StudentCreds.new
  	@student_creds.verify(false)	
  end
end
