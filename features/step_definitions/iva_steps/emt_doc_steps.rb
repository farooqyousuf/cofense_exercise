Given(/^I click on the Verify using EMT Doc link$/) do
  DocEMT.new.click_verify_emt_doc_link
end

Given(/^I verify using EMT doc upload$/) do
  DocEMT.new.verify(type: "unique")
end

Given(/^I submit the EMT document verification form as a "([^"]*)" record$/) do |type|
  DocEMT.new.verify(type: type)
end
