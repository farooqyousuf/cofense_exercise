Given(/^I should have successfully verified that a document was uploaded$/) do
  @admin_tool = AdminTool.new
  @admin_tool.login_in_new_window

  step 'I visit "AdminDocs"'
  @admin_docs = AdminDocs.new
  @admin_docs.verify_doc_upload(@username)
end

Given(/^I submit the military document form for "([^"]*)"$/) do |affiliation|
  MilitaryDoc.new.verify(affiliation: affiliation, type: "no_doc")
end

Given(/^I should see the error message for required document upload$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
