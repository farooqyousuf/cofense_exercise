Given("I check the Wallet dashboard page is visible") do
 expect(page).to have_css(".wallet-content-main",:visible => true)
 expect(page).to have_css(".wallet-dashboard-module",:visible => true)
 expect(page).to have_text "Activity Feed"
 end

Given("I click on the shared side navigation") do
  @WalletDashboard.open_shared_side_navigation
end

Given("I click sign out on the shared side navigation") do
  @WalletDashboard.click_shared_side_navigation_sign_out
end

Given("I verify ID\.me logo is present") do
  expect(page).to have_css("img.shared-nav-logo")
 end

Given("I verify that the Wallet nav {string} tab redirects to page") do |nav_tab|
  visit FigNewton.wallet.homepage.url
  @WalletDashboard.click_shared_nav_tab(nav_tab)
  sleep 3
  expected_url = case nav_tab
                 when "About"    then FigNewton.idme.about_page
                 when "Business" then FigNewton.idme.business_page
                 when "Shop"     then FigNewton.shop.shop_homepage
                 when "Wallet"   then FigNewton.wallet.homepage.url
                 else fail ("#{expected_url} not found")
                 end

  expect(page).to have_current_path(expected_url, :url => true)
end

Given("I verify that the sub-nav {string} link redirects to page") do |subnav_link|
  @WalletDashboard.click_wallet_subnav(subnav_link)
  expected_path = case subnav_link
                  when "Dashboard"      then "/"
                  when "IDs and Logins" then "/ids"
                  when "Settings"       then "/settings"
                  when "Activity"       then "/activities"
                  else fail ("#{expected_path} not found")
                  end

  expect(page).to have_current_path(expected_path)
end

Given("I verify user email is displayed") do
  account_email = @WalletDashboard.user_account_email
  test_email_used = FigNewton.shop_users.military
  expect(account_email).to eq(test_email_used)
end

Given("I verify membership date is displayed correctly") do
  membership_date = @WalletDashboard.account_membership_date
  @WalletDashboard.valid_date?(membership_date)
end

Given("I verify that View Full Profile link directs me to correct page") do
  @WalletDashboard.click_view_profile
  expect(page).to have_current_path("/settings")
  expect(page).to have_css("div.wallet-settings-user")
end

Given("I should be on the Wallet dashboard page url") do
  expect(page).to have_current_path(FigNewton.wallet.homepage.url, :url => true)
end

Given("I verify required main header sections are visible within home page") do
  expect(@WalletDashboard.find_page_header).to have_content "Dashboard"
  expect(@WalletDashboard.find_ids_and_logins_subheader).to have_content "IDs and Logins"
  expect(@WalletDashboard.find_activity_feed_subheader).to have_content "Activity Feed"
end

Given("I verify that IDs toggle button directs me to corresponding view") do
  expect(@WalletDashboard.find_my_ids_section).to have_content "My IDs"
  expect(page).to have_css("div.card-military")
end

Given("I verify that Logins toggle button directs me to corresponding view") do
  @WalletDashboard.click_logins_toggle_button
  expect(@WalletDashboard.find_my_ids_section).to have_content "Active Logins"
  expect(page).to have_text "You currently have no logins in your wallet."
end

Given("I verify that 'View All' links take me to the correct urls") do
  @WalletDashboard.click_ids_and_logins_view_all
  expect(page).to have_current_path("/ids")
  @WalletDashboard.click_wallet_subnav("Dashboard")
  @WalletDashboard.click_activity_feed_view_all
  expect(page).to have_current_path("/activities")
end

Given("I verify 'Add ID' button triggers affinity group modal") do
  @WalletDashboard.click_wallet_subnav("Dashboard")
  @WalletDashboard.click_add_id_button
  expect(@WalletDashboard.find_add_id_modal).to have_content "Adding an ID will give you access to benefits at ID.me partners that accept that ID."
  @WalletDashboard.close_id_modal
end

Given("I verify Teacher ID button") do
  @WalletDashboard.teacher_flow_view
  expect(@WalletDashboard.find_flow_header).to have_content "Teacher ID"
  @WalletDashboard.browser_cleanup
end

Given("I verify Responder ID button") do
  @WalletDashboard.responder_flow_view
  expect(@WalletDashboard.find_flow_header).to have_content "Responder ID"
  @WalletDashboard.browser_cleanup
end

Given("I verify Government ID button") do
  @WalletDashboard.government_flow_view
  expect(@WalletDashboard.find_flow_header).to have_content "Government ID"
  @WalletDashboard.browser_cleanup
end

Given("I verify Student ID button") do
  @WalletDashboard.student_flow_view
  expect(@WalletDashboard.find_flow_header).to have_content "Student ID"
  @WalletDashboard.browser_cleanup
end
