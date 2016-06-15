Given(/^I verify using police officer documentation$/) do
  step 'I generate a unique doc'
  @police = Police.new
  @police.verify
end

Given(/^I submit the empty Police form$/) do
  @police = Police.new
  @police.verify(false)
end
