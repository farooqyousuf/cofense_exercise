Given(/^I approve the EMT verification in IDme admin$/) do

  @admin_tool = AdminTool.new
  @admin_tool.login_in_new_window

  step 'I visit "AdminEMTVerifs"'
  @admin_emt_verifs = AdminEMTVerifs.new
  @admin_emt_verifs.approve_doc

  @admin_tool.logout_in_new_window
end

Given(/^I submit the empty EMT state lookup form$/) do
  @emt_lookup = LookupEMT.new.verify(false)
end

Given(/^I verify using EMT state lookup$/) do
  LookupEMT.new.verify
end

Given(/^I should be on the responder verification screen$/) do
  @police = Police.new
  find(@police.header_css).visible?
end

Given(/^I verify using police officer documentation$/) do
  step 'I generate a unique doc'
  @police = Police.new
  @police.verify
end

Given(/^I submit the empty Police form$/) do
  @police = Police.new
  @police.verify(false)
end

Given(/^I verify using a ProBoard Firefighter$/) do
  @pb_firefighter = PBFirefighter.new
  @pb_firefighter.verify
end

Given(/^I submit the empty ProBoard Firefighter form$/) do
  PBFirefighter.new.verify(false)
end

Given(/^I verify using firefighter documentation$/) do
  DocFirefighter.new.verify
end

Given(/^I submit the empty Firefighter doc upload form$/) do
  DocFirefighter.new.verify(false)
end

Given(/^I verify using nationally certified EMT credentials$/) do
  NationalEMT.new.verify
end

Given(/^I submit the empty National EMT form$/) do
  NationalEMT.new.verify(false)
end

Given(/^I verify using EMT doc upload$/) do
  DocEMT.new.verify
end

Given(/^I submit the EMT Document verification form as a dupe record$/) do
  DocEMT.new.verify(dupe: true)
end

Given(/^I submit the empty EMT doc upload form$/) do
  DocEMT.new.verify(populate: false)
end
