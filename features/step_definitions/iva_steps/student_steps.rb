Given(/^I should be on the student verification screen$/) do
  expect(page).to have_content "Student ID"
end

Given(/^I verify using student credentials$/) do
  @StudentCreds.click_verify_by_creds
  @StudentCreds.click_begin
  @StudentCreds.verify(type: "unique")
  @StudentCreds.click_continue
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
