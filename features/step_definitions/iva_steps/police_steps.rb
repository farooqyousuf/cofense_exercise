Given(/^I verify using police officer documentation$/) do
  step 'I generate a unique doc'
  Police.new.verify(type: "unique")
end

Given(/^I submit the empty Police form$/) do
  Police.new.verify(populate: false)
end

Given(/^I submit the police verification form as a "([^"]*)" record$/) do |type|
  Police.new.verify(type: type)
end
