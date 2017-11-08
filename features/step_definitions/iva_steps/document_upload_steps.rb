Given(/^I verify that a document was successfully uploaded$/) do
  @SupportTool.login_in_new_window
  step 'I visit "SupportToolDocs"'
  @SupportToolDocs.verify_doc_upload(@user_email)
end

Given(/^I verify that a "([^"]*)" document was successfully uploaded$/) do |document|
  @SupportTool.login_in_new_window
  step 'I visit "SupportToolDocs"'
  @SupportToolDocs.verify_unique_doc_upload(@user_email, document: document)
end

Given(/^I verify that a document was not uploaded$/) do
  @SupportTool.login_in_new_window
  @SupportToolDocs.verify_doc_is_not_uploaded(@user_email)
end

Given(/^I verify using military "([^"]*)" documentation for Service Member$/) do |document|
  MilitaryDoc.new.verify(affiliation: "Service Member", document: document, type: "unique_doc")
end

Given(/^I submit the military document form for "([^"]*)"$/) do |affiliation|
  MilitaryDoc.new.verify(affiliation: affiliation, type: "no_doc")
end
