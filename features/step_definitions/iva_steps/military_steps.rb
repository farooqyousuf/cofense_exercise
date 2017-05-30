Given(/^I should be on the military verification screen$/) do
  @dd214 = DD214.new
  # find(@dd214.header_css).visible?
end

Given(/^I verify using an ID\.me military passcode$/) do
  step 'I scroll to the bottom of the page'
  click_link("Verify using an ID.me military passcode")
  step 'I click on the Begin link'
  fill_in "verification[passcode]", :with => "ID.me"
  click_button("Continue")
  click_link("Continue")
end
