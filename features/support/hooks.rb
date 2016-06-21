# NOTE: order matters here, hooks defined last will be ran first

#Actions performed before/after each scenario
Before("@desktop") do
  page.driver.browser.manage.window.maximize
end

After do
  Capybara.current_session.driver.quit
end

After("@delete_dd214_user2") do
  visit_admin_users_in_new_window
  @admin_users.delete_dd214_user2
  @admin_tool.logout_in_new_window
end

After("@delete_dd214_user") do
  visit_admin_users_in_new_window
  @admin_users.delete_dd214_user
  @admin_tool.logout_in_new_window
end

After("@delete_paypal_user") do
  visit_admin_users_in_new_window
  @admin_users.delete_paypal_user
  @admin_tool.logout_in_new_window
end

After("@delete_facebook_user") do
  visit_admin_users_in_new_window
  @admin_users.delete_facebook_user
  @admin_tool.logout_in_new_window
end

After("@delete_google_user") do
  visit_admin_users_in_new_window
  @admin_users.delete_google_user
  @admin_tool.logout_in_new_window
end

After("@delete_linkedin_user") do
  visit_admin_users_in_new_window
  @admin_users.delete_linkedin_user
  @admin_tool.logout_in_new_window
end

After("@delete_scra_denied_user") do
  visit_admin_users_in_new_window
  @admin_users.delete_scra_denied_user
  @admin_tool.logout_in_new_window
end

After("@delete_scra_user1") do
  visit_admin_users_in_new_window
  @admin_users.delete_scra_user1
  @admin_tool.logout_in_new_window
end

After("@delete_scra_user2") do
  visit_admin_users_in_new_window
  @admin_users.delete_scra_user2
  @admin_tool.logout_in_new_window
end

After("@delete_scra_user3") do
  visit_admin_users_in_new_window
  @admin_users.delete_scra_user3
  @admin_tool.logout_in_new_window
end

After("@delete_scra_user4") do
  visit_admin_users_in_new_window
  @admin_users.delete_scra_user4
  @admin_tool.logout_in_new_window
end

After("@delete_scra_user5") do
  visit_admin_users_in_new_window
  @admin_users.delete_scra_user5
  @admin_tool.logout_in_new_window
end

After("@delete_experian_user1") do
  visit_admin_users_in_new_window
  @admin_users.delete_experian_user1
  @admin_tool.logout_in_new_window
end

After("@delete_experian_user2") do
  visit_admin_users_in_new_window
  @admin_users.delete_experian_user2
  @admin_tool.logout_in_new_window
end

After("@delete_experian_user3") do
  visit_admin_users_in_new_window
  @admin_users.delete_experian_user3
  @admin_tool.logout_in_new_window
end

After("@delete_user") do
  visit_admin_users_in_new_window
  @admin_users.open_newest(true)
  @admin_users.delete_user
  @admin_tool.logout_in_new_window
end

After("@marketplace_cash_back") do
 @marketplace_shop.sign_out
end

After("@delete_natl_emt") do
  visit_admin_users_in_new_window
  @admin_users.delete_natl_emt
  @admin_tool.logout_in_new_window
end

After("@mp_user_group_affiliations") do 
  visit_admin_users_in_new_window
  @admin_user_marketplace.delete_marketplace_test_user
  @admin_tool.logout_in_new_window
end 
