# NOTE: order matters here, hooks defined last will be ran first

#Actions performed before/after each scenario
Before("@desktop") do
end

After do
  Capybara.current_session.driver.quit
end

#Have to revisit this and fix it
# After do |scenario|
#   if scenario.failed?
#     file = "FAILED_#{scenario.name.gsub(" ","_").gsub(/[^0-9A-Za-z_]/, "")}.png"

#     # create directory for images
#     # Dir.mkdir("./screenshots") unless Dir.exists?("./screenshots")
#     Dir.mkdir("./screenshots") unless Dir.exists?("./screenshots")

#     # save the file locally
#     page.save_screenshot("#{Dir.pwd}/screenshots/#{file}")

#     if AllureCucumber::FeatureTracker.tracker
#       # attaches failed test screenshot to Allure reports
#       attach_file(file, File.open("#{Dir.pwd}/screenshots/#{file}"))
#     end
#   end
# end

After("@delete_mil_doc_multi_family_users") do
  visit_admin_users_in_new_window
  @admin_users.delete_mil_doc_multi_family_users
  @admin_tool.logout_in_new_window
end

After("@delete_scra_multi_family_users") do
  visit_admin_users_in_new_window
  @admin_users.delete_scra_multi_family_users
  @admin_tool.logout_in_new_window
end

After("@delete_natl_emt_dupe") do
  visit_admin_users_in_new_window
  @admin_users.delete_natl_emt
  @admin_users.delete_natl_emt
  @admin_tool.logout_in_new_window
end

After("@delete_scra_dupe_user") do
  visit_admin_users_in_new_window
  @admin_users.delete_scra_user1
  @admin_users.delete_scra_user1
  @admin_tool.logout_in_new_window
end

After("@delete_dd214_dupe_user") do
  visit_admin_users_in_new_window
  @admin_users.delete_current_username
  @admin_users.delete_dd214_user
  @admin_tool.logout_in_new_window
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

After("@delete_current_user_email") do
  delete_user(@user_email)
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

After("@delete_pb_fireman_user") do
  visit_admin_users_in_new_window
  @admin_users.delete_pb_fireman_user
  @admin_tool.logout_in_new_window
end

After("@delete_natl_emt") do
  visit_admin_users_in_new_window
  @admin_users.delete_natl_emt
  @admin_tool.logout_in_new_window
end

After("@mp_user_group_affiliations") do
  visit_admin_users_in_new_window
  @admin_user_shop.delete_shop_test_user
  @admin_tool.logout_in_new_window
end

After("@shop_cash_back") do
  visit_admin_users_in_new_window
  @admin_users.delete_shop_test_user
  @admin_tool.logout_in_new_window
end

After("@wallet_signup") do
  visit_admin_users_in_new_window
  @admin_users.delete_shop_test_user
  @admin_tool.logout_in_new_window
end

After("@wallet_military_verify") do
  visit_admin_users_in_new_window
  @admin_users.delete_shop_test_user
  @admin_tool.logout_in_new_window
end

After("@wallet_account_locked") do
  visit_admin_users_in_new_window
  @admin_users.delete_shop_test_user
  @admin_tool.logout_in_new_window
end

After("@wallet_account_sign_up_social_federation") do
  visit_admin_users_in_new_window
  @admin_users.delete_shop_test_user
  @admin_tool.logout_in_new_window
end

def delete_user(email)
  # TODO: Extract to own class
  url   = FigNewton.admin.users_endpoint
  query = { "email" => ERB::Util.url_encode(@user_email) }
  auth  = { :username => FigNewton.admin.api_username, :password => FigNewton.admin.api_password }

  HTTParty.delete(url, :query => query, :basic_auth => auth)
end
