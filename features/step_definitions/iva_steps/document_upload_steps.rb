Given(/^I should have successfully verified that a document was uploaded$/) do
  @admin_tool = AdminTool.new
  @admin_tool.logout_in_new_window

  step 'I visit "AdminDocs"'
  @admin_docs = AdminDocs.new

  @admin_docs.verify_doc
end
