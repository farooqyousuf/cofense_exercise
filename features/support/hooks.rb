# NOTE: order matters here, hooks defined last will be ran first

# Actions performed before/after each scenario
Before do
  page.driver.browser.manage.window.maximize
end

After("@oauth_tester_logout") do
  click_link("Logout »")
end

After("@delete_user") do 
  @admin_tool.login_in_new_window
  admin_users = AdminUsers.new
  admin_users.visit
  admin_users.delete_user
  @admin_tool.logout_in_new_window
end