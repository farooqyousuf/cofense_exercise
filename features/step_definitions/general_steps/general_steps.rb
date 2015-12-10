Given(/^I visit "(.*?)"$/) do |page|
  @page = Object.const_get(page).new # converts a string text into a class name
  @page.visit
end

Given(/^I pry$/) do
  binding.pry
end
