Given(/^I approve the EMT verification in IDme admin$/) do

  @admin_tool = AdminTool.new
  @admin_tool.login_in_new_window

  step 'I visit "AdminEMTVerifs"'
  @admin_emt_verifs = AdminEMTVerifs.new
  @admin_emt_verifs.approve_doc

  @admin_tool.logout_in_new_window
end
