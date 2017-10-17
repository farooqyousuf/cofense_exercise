Given(/^I create a EMT National page object$/) do
  @EMTNational = NationalEMT.new
end

Given(/^I click on the Verify using EMT National link$/) do
  @EMTNational.click_verify_emt_national_link
end

Given(/^I verify using nationally certified EMT credentials$/) do
  @EMTNational.verify(type: "unique")
end

Given(/^I submit the empty National EMT form$/) do
  @EMTNational.verify(populate: false)
end

Given(/^I submit the emt national verification form as a "([^"]*)" record$/) do |type|
  @EMTNational.verify(type: type)
end
