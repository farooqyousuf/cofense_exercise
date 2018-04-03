Given(/^I create a Government page object$/) do
  @IVAGovernment = IVAGovernment.new
end

Given(/^I submit the empty government form$/) do
  @IVAGovernment.verify(populate: false)
end

Given(/^I submit the government verification form as a "([^"]*)" record$/) do |type|
  @IVAGovernment.verify(email_type: type)
end

Given(/^I clear the current Government session$/) do
  browser = Capybara.current_session.driver.browser
  step 'I visit IDP through the "government" policy'
  browser.manage.delete_all_cookies
  browser.navigate.refresh
  step 'I visit IDP through the "government" policy'
end
