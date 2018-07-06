Given(/^I submit the empty EMT state lookup form$/) do
  @StateLookupEMT.verify(populate: false)
end

Given(/^I verify using EMT state lookup$/) do
  @StateLookupEMT.verify(type: "unique")
end

Given(/^I submit the emt state lookup verification form as a "([^"]*)" record$/) do |type|
  @StateLookupEMT.verify(type: type)
end

Given(/^I click on the Verify using EMT State Lookup link$/) do
  @StateLookupEMT.click_verify_emt_state_link
end
