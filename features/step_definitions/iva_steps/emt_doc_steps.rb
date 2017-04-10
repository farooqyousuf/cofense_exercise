Given(/^I verify using EMT doc upload$/) do
  DocEMT.new.verify(type: "unique")
end

Given(/^I submit the EMT document verification form as a "([^"]*)" record$/) do |type|
  DocEMT.new.verify(type: type)
end
