Given(/^I login the admin tool$/) do
  @admin = AdminTool.new.login
end

Given(/^I verify with SCRA for "([^"]*)"$/) do |affiliation|
  username = @username
  VerifyWithScra.new.verify_via_scra(@username, affiliation: affiliation)
end

Given(/^I should be successfully verified as a "([^"]*)"$/) do |group|
  username = @username
  VerifyWithScra.new.verify_scra_applied(@username, affiliation: group)
end

Given(/^I submit the empty SCRA form for "([^"]*)" in Admin tool$/) do |group|
  VerifyWithScra.new.verify_via_scra(@username, affiliation: group, populate: false)
end

Given(/^I should see errors on required fields for "([^"]*)" in Admin tool$/) do |affiliation|
  form_field = %w[service_member_first_name service_member_last_name service_member_birth_date social service_date]
  form_field_family = %w[first_name last_name birth_date]

  fields = case affiliation
           when "Service Member", "Veteran", "Retiree"    then form_field
           when "Military Family", "Military Spouse"      then form_field.push(*form_field_family)
           else fail("Affiliation not found")
           end

  VerifyWithScra.new.check_admin_scra_form_error(fields, affiliation: affiliation)
end
