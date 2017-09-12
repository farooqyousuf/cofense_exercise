Given(/^I should be on the student verification screen$/) do
  @student_creds = StudentCreds.new
  find(@student_creds.header_css).visible?
end

Given(/^I verify using student credentials$/) do
  @student_creds.click_verify_by_creds
  @student_creds.click_begin
  @student_creds.verify(type: "unique")
  @student_creds.click_continue
end

Given(/^I submit the student credentials verification form as a "([^"]*)" record$/) do |type|
  StudentCreds.new.verify(type: type)
end

Given(/^I submit the empty Student form using "([^"]*)"$/) do |method|
  case method
  when "Student Credentials"
    StudentCreds.new.verify(populate: false)
  when "Student Document"
    StudentDoc.new.verify(populate: false)
  end
end

Given(/^I verify using student documentation$/) do
  step 'I generate a unique doc'
  StudentDoc.new.verify(type: "unique")
end

Given(/^I submit the student doc upload verification form as a "([^"]*)" record$/) do |type|
  StudentDoc.new.verify(type: type)
end

Given(/^I click on the Verify by uploading documentation link$/) do
  StudentDoc.new.click_verify_by_doc
end

Given(/^I click on the Verify using your student credentials link$/) do
  StudentCreds.new.click_verify_by_creds
end
