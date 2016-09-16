Given(/^I verify using EMT doc upload$/) do
  DocEMT.new.verify(type: "unique")
end
