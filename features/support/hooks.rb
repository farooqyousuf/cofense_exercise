# NOTE: order matters here, hooks defined last will be ran first

# Actions performed before/after each scenario
Before do
  page.driver.browser.manage.window.maximize
end

After("@oauth_tester_logout") do
  click_link("Logout »")
end