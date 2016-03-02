Given(/^I should be on the responder verification screen$/) do
  @police = Police.new
  find(@police.header_css).visible?
end

Given(/^I verify using police officer documentation$/) do
  step 'I generate a unique doc'
  @police = Police.new
  @police.verify
end

Given(/^I submit the empty Police form$/) do
  @police = Police.new
  @police.verify(false)
end

Given(/^I verify using a ProBoard Firefighter$/) do
  @pb_firefighter = PBFirefighter.new
  @pb_firefighter.verify
end

Given(/^I submit the empty ProBoard Firefighter form$/) do
  PBFirefighter.new.verify(false)
end

Given(/^I verify using firefighter documentation$/) do
  DocFirefighter.new.verify
end

Given(/^I submit the empty Firefighter doc upload form$/) do
  DocFirefighter.new.verify(false)
end

Given(/^I verify using nationally certified EMT credentials$/) do
  NationalEMT.new.verify
end

Given(/^I submit the empty National EMT form$/) do
  NationalEMT.new.verify(false)
end
