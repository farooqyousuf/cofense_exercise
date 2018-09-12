Given("I click on the Verify by requesting DD214 link") do
  @DD214.click_verify_by_dd214_link
end

Given("I submit the empty DD214 form for {string}") do |group|
  @DD214.verify(affiliation: group, populate: false)
end

Given("I submit the DD214 verification form as a {string} record") do |status|
  @DD214.verify(type: status)
end

Given("I {string} the DD214 in IDme admin") do |action|
  @admin_tool = AdminTool.new
  @admin_tool.login_in_new_window

  step 'I visit "AdminDD214Requests"'
  @admin_dd214_requests = AdminDD214Requests.new

  if action == "fax"
    @admin_dd214_requests.fax_doc
  else
    @admin_dd214_requests.deny_dd214
  end

  @admin_tool.logout_in_new_window
end

Given(/^I verify using DD214 information for "(.*)" via "(.*)"$/) do |affiliation, method|
  if method == "SCRA"
    @DD214.verify(affiliation: affiliation, type: "unique", method: method)
  else
    @DD214.verify(affiliation: affiliation, type: "unique", method: method)
  end
  click_link("Continue")
  if page.has_text? "ID.me Staging would like to access some of your data"
    step 'I authorize the attribute release'
  end
end

Given(/^I verify using duplicate DD214 information for "(.*)" via "(.*)"$/) do |affiliation, method|
  @DD214.verify(affiliation: affiliation, type: "dupe", method: method)
end
