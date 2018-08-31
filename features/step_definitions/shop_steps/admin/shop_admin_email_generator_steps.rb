Given("I navigate to the create a new email template page") do
  @ShopAdminEmailGenerator.click_create_new_email_template
end

Given("I submit a valid new weekly email template with no offers") do
  @ShopAdminEmailGenerator.submit_valid_weekly_email_no_offers
end

Given("I verify that the new email template has been saved") do
  expect(page).to have_css(".alert-success", :text => "Email template successfully created.")
end

Given("I delete the new email template") do
  @ShopAdminEmailGenerator.click_delete
  expect(page).to have_css(".alert-success", :text => "Email Template Successfully destroyed")
end
