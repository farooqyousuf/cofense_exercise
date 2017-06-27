Given(/^I verify that a document was successfully uploaded$/) do
  @admin_tool = AdminTool.new
  @admin_tool.login_in_new_window

  step 'I visit "AdminDocs"'
  @admin_docs = AdminDocs.new
  @admin_docs.verify_doc_upload(@user_email)
end

Given(/^I submit the military document form for "([^"]*)"$/) do |affiliation|
  MilitaryDoc.new.verify(affiliation: affiliation, type: "no_doc")
end
