Given(/^I create a EMT State Doc page object$/) do
  @EMTStateDoc = StateDocEMT.new
end

Given(/^I click on the Verify using EMT State Doc link$/) do
  @EMTStateDoc.click_verify_emt_state_doc_link
end

Given(/^I verify using state EMT doc upload$/) do
  step 'I generate a unique "png" doc'
  @EMTStateDoc.verify(type: "unique")
end

Given(/^I submit the empty state EMT doc upload form$/) do
  @EMTStateDoc.verify(populate: false)
end

Given(/^I submit the state EMT Document Upload form as a "([^"]*)" record$/) do |type|
  @EMTStateDoc.verify(type: type)
end
