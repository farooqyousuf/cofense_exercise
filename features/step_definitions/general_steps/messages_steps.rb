Given("I should see this message {string} on this field {string}") do |expected_text, css|
  validate_error_message(expected_text, css)
end

Given(/^I should see the error message "(.*?)"$/) do |expected_text|
  sleep 2
  p_tag_message.should eq(expected_text)
end

Given("I should see the multi-line error message:") do |expected_text|
  sleep 2
  p_tag_message.should eq(expected_text)
end

Given(/^I should see the red alert box error message "(.*?)"$/) do |expected_text|
  red_alert_box_message.should eq(expected_text)
end

Given(/^I should see the green alert box error message "(.*?)"$/) do |expected_text|
  green_alert_box_message.should eq(expected_text)
end

Given(/^I should see the blue alert box error message "([^"]*)"$/) do |expected_text|
  blue_alert_box_message.should eq(expected_text)
end

Given(/^I should see an error on the "(.*)" field$/) do |expected_text|
  sleep 1
  expect(all(error_label_css).map(&:text)).to include(expected_text)
end

Given(/^I should see error messages on required fields for "([^"]*)"$/) do |method|
  var = case method
        when "Government"                then IVAGovernment
        when "DD214 Vet"                 then DD214
        when "DD214 Non-Vet"             then DD214NonVet
        when "Military Email"            then MilitaryEmail
        when "Military Email Family"     then MilitaryEmailFamily
        when "Military Document"         then MilitaryDoc
        when "Military Document Family"  then MilitaryDocFamily
        when "Student Credentials"       then StudentCreds
        when "Student Document"          then StudentDoc
        when "Canadian Student"          then StudentCanada
        when "Teacher Document"          then TeacherDoc
        when "Teacher Lookup Delaware"   then TeacherLookupDE
        when "Teacher Lookup New Mexico" then TeacherLookupNM
        when "Teacher Lookup Michigan"   then TeacherLookupMI
        when "Teacher Lookup Alabama"    then TeacherLookupAL
        when "Police"                    then Police
        when "ProBoard Firefighter"      then PBFirefighter
        when "Firefighter doc upload"    then DocFirefighter
        when "National EMT"              then NationalEMT
        when "EMT state doc"             then StateDocEMT
        when "SCRA"                      then MilitarySCRA
        when "SCRA Family"               then MilitarySCRAFamily
        when "EMT state lookup"          then StateLookupEMT
        when "Identity Verification"     then IDVComputer
        when "Employee"                  then IVAEmployee
        else fail("Verification option not found")
        end

    page = (var).new
    sleep 1
    page.required_fields.each do |field|
    expect(page.error_on(field)).to be_truthy
  end
end

Given(/^I should see the red error "(.*?)" under the textfield$/) do |expected_text|
  red_error_under_textfield.should eq(expected_text)
end

Given(/^I should see the red error "([^"]*)" under the file upload field$/) do |expected_text|
  red_error_under_file_upload.should eq(expected_text)
end

Given(/^I should see a red highlighted error on the "([^"]*)"$/) do |fields|
  user_password = "#user_password"
  confirm_password = "#user_password_confirmation"
  tos_field = ".checkbox.error span"

  case fields
  when "password, confirm password and tos fields"
    check_idp_red_highlighted_error(user_password)
    check_idp_red_highlighted_error(confirm_password)
    check_idp_red_highlighted_error(tos_field)
  when "confirm password and tos fields"
    check_idp_red_highlighted_error(confirm_password)
    check_idp_red_highlighted_error(tos_field)
  when "tos field"
    check_idp_red_highlighted_error(tos_field)
  else fail("Field or selection not found")
  end
end
