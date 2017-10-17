Given(/^I create a EMT Document page object$/) do
  @EMTDoc = DocEMT.new
end

Given(/^I click on the Verify using EMT Doc link$/) do
  @EMTDoc.click_verify_emt_doc_link
end

Given(/^I verify using EMT doc upload$/) do
  @EMTDoc.verify(type: "unique")
end

Given(/^I submit the EMT document verification form as a "([^"]*)" record$/) do |type|
  @EMTDoc.verify(type: type)
end
