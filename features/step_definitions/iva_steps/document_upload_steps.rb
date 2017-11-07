Given(/^I verify that a document was successfully uploaded$/) do
  @support_tool = SupportTool.new
  @support_tool.login_in_new_window

  step 'I visit "SupportToolDocs"'
  @support_tool_docs = SupportToolDocs.new
  @support_tool_docs.verify_doc_upload(@user_email)
end

Given(/^I verify that a "([^"]*)" document was successfully uploaded$/) do |document|
  @support_tool = SupportTool.new
  @support_tool.login_in_new_window

  step 'I visit "SupportToolDocs"'
  @support_tool_docs = SupportToolDocs.new
  @support_tool_docs.verify_unique_doc_upload(@user_email, document: document)
end

Given(/^I verify using military "([^"]*)" documentation for Service Member$/) do |document|
  MilitaryDoc.new.verify(affiliation: "Service Member", document: document, type: "unique_doc")
end

Given(/^I submit the military document form for "([^"]*)"$/) do |affiliation|
  MilitaryDoc.new.verify(affiliation: affiliation, type: "no_doc")
end
