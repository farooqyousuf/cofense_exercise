Given(/^I should be on the responder verification screen$/) do
  @police = Police.new
  find(@police.header_css).visible?
end

Given(/^I verify using police officer documentation$/) do
  step 'I generate a unique doc'
  @police = Police.new
  @police.verify
end