Given(/^I click on the Verify using EMT Doc link$/) do
  @DocEMT.click_verify_emt_doc_link
end

Given(/^I verify using EMT doc upload$/) do
  step 'I generate a unique "png" doc'
  @DocEMT.verify(type: "unique")
end

Given(/^I submit the EMT document verification form as a "([^"]*)" record$/) do |type|
  @DocEMT.verify(type: type)
end
