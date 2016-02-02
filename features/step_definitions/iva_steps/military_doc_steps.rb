Given(/^I verify using military documentation for "([^"]*)"$/) do |affiliation	|
  step 'I generate a unique military doc'
  @military_doc = MilitaryDoc.new
  @military_doc.verify(affiliation, true)
end

Given(/^I approve the document in IDme admin$/) do
  @admin_tool = AdminTool.new
  @admin_tool.login_in_new_window

  step 'I visit "AdminDocs"'
  @admin_docs = AdminDocs.new

  @admin_docs.approve_doc
  
  @admin_tool.logout_in_new_window
end

Given(/^I submit the empty military document form for "([^"]*)"$/) do |group|
  @military_doc = MilitaryDoc.new
  @military_doc.verify(group, false)
end

