Given(/^I verify using nationally certified EMT credentials$/) do
  NationalEMT.new.verify(type: "unique")
end

Given(/^I submit the empty National EMT form$/) do
  NationalEMT.new.verify(populate: false)
end

Given(/^I submit the emt national verification form as a "([^"]*)" record$/) do |type|
  NationalEMT.new.verify(type: type)
end