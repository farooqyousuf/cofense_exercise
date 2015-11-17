# NOTE: order matters here, hooks defined last will be ran first

# Actions performed before/after each scenario
Before do
  page.driver.browser.manage.window.maximize
end

After("~@oauth_tester") do
  sign_out_of_idme
end

After("@oauth_tester", "~oauth_tester_neg") do
  click_link("Logout »")
end