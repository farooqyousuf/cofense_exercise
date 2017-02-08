Given(/^I visit the admin tool$/) do
  @admin_tool = AdminTool.new
  @admin_tool.login_in_new_window
end

Given(/^I create user$/) do
  click_link("Members")
  click_link("Users")
  click_link("Add new user")
  find("#s2id_user_consumer_id").click
  find(".select2-results > li:nth-child(9)").click
  fill_in "Email", :with => FigNewton.test_user.student.user_email
end

Given(/^I verify new user was created$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
