Given(/^I visit "(.*?)"$/) do |page|
  @page = Object.const_get(page).new # converts a string text into a class name
  @page.visit
end

Given(/^I pry$/) do
  binding.pry
end

Given(/^I complete the verification process$/) do
  @iva_success = IVASuccess.new
  @iva_success.click_here_to_finish
end