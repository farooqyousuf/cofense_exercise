Given(/^I click on the Verify using EMT State Doc link$/) do
  @StateDocEMT.click_verify_emt_state_doc_link
end

Given(/^I verify using state EMT doc upload$/) do
  step 'I generate a unique "png" doc'
  @StateDocEMT.verify(type: "unique")
end

Given(/^I submit the empty state EMT doc upload form$/) do
  @StateDocEMT.verify(populate: false)
end

Given(/^I submit the state EMT Document Upload form as a "([^"]*)" record$/) do |type|
  @StateDocEMT.verify(type: type)
end
