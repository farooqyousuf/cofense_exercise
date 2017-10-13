Given(/^I should be on the government verification screen$/) do
  find(@IVAGovernment.header_css).visible?
  expect(page).to have_content "Government ID"
end

Given(/^I submit the empty government form$/) do
  @IVAGovernment.verify(populate: false)
end

Given(/^I submit the government verification form as a "([^"]*)" record$/) do |type|
  @IVAGovernment.click_begin
  @IVAGovernment.verify(email_type: type)
end

Given(/^I clear the current Government session$/) do
  browser = Capybara.current_session.driver.browser
  step 'I visit IDP through the "government" policy'
  browser.manage.delete_all_cookies
  browser.navigate.refresh
  step 'I visit IDP through the "government" policy'
end
