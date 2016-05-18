Given(/^I should be on the government verification screen$/) do
  @iva_govt = IVAGovernment.new
  find(@iva_govt.header_css).visible?
end

Given(/^I submit the government verification form$/) do
  @iva_govt.verify
  @iva_govt.click_verify_button
end

Given(/^I submit the empty government form$/) do
  @iva_govt = IVAGovernment.new
  @iva_govt.verify(populate: false)
end

Given(/^I submit the government verification form as a dupe record$/) do
  @iva_govt = IVAGovernment.new
  @iva_govt.verify(populate: true, dupe: true)
end

Given(/^I clear the current Government session$/) do
  browser = Capybara.current_session.driver.browser
  step 'I visit IDP through the "government" policy'
  browser.manage.delete_all_cookies
  browser.navigate.refresh
  step 'I visit IDP through the "government" policy'
end
