Given(/^I verify using nationally certified EMT credentials$/) do
  NationalEMT.new.verify
end

Given(/^I submit the empty National EMT form$/) do
  NationalEMT.new.verify(false)
end
