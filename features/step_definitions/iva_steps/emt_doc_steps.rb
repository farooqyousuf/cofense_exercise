Given(/^I verify using EMT doc upload$/) do
  DocEMT.new.verify
end

Given(/^I submit the EMT Document verification form as a dupe record$/) do
  DocEMT.new.verify(dupe: true)
end

Given(/^I submit the empty EMT doc upload form$/) do
  DocEMT.new.verify(populate: false)
end
