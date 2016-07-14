Given(/^I verify using EMT doc upload$/) do
  DocEMT.new.verify(type: "unique")
end

Given(/^I submit the empty EMT doc upload form$/) do
  DocEMT.new.verify(populate: false)
end

Given(/^I submit the EMT Document Upload form as a "([^"]*)" record$/) do |type|
  DocEMT.new.verify(type: type)
end
