Given(/^I create a Student Creds page object$/) do
  @StudentCreds = StudentCreds.new
end

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
  @StudentCreds.verify(type: type)
end

Given(/^I submit the empty Student form using "([^"]*)"$/) do |method|
  case method
  when "Student Credentials"
    @StudentCreds.verify(populate: false)
  when "Student Document"
    @StudentCreds.verify(populate: false)
  end
end

Given(/^I click on the Verify using your student credentials link$/) do
  @StudentCreds.click_verify_by_creds
end
