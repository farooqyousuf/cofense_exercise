# NOTE: order matters here, hooks defined last will be ran first

# Actions performed before/after each scenario
Before do
  page.driver.browser.manage.window.maximize
end

After("@oauth_tester_logout") do
  if page.has_link?("Logout »")
    click_link("Logout »")
  else
    visit('https://oauth-tester-staging.idmeinc.net/oauths/6/logout')
  end
end

After("@delete_user") do
  @admin_tool = AdminTool.new
  @admin_tool.login_in_new_window
  sleep 2
  admin_users = AdminUsers.new
  sleep 2
  admin_users.visit
  admin_users.delete_user
  @admin_tool.logout_in_new_window
end

After("@marketplace_cash_back") do
 @marketplace_shop.sign_out
end
