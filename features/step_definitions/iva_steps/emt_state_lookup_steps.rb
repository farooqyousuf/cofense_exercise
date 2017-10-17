Given(/^I create a EMT State Lookup page object$/) do
  @EMTStateLookup = StateLookupEMT.new
end

Given(/^I submit the empty EMT state lookup form$/) do
  @EMTStateLookup.verify(populate: false)
end

Given(/^I verify using EMT state lookup$/) do
  @EMTStateLookup.verify(type: "unique")
end

Given(/^I submit the emt state lookup verification form as a "([^"]*)" record$/) do |type|
  @EMTStateLookup.verify(type: type)
end

Given(/^I click on the Verify using EMT State Lookup link$/) do
  @EMTStateLookup.click_verify_emt_state_link
end
