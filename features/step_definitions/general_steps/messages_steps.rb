Given(/^I should see the error message "(.*?)"$/) do |expected_text|
  (p_tag_message.should eq(expected_text)).should == true
end

Given(/^I should see the red alert box error message "(.*?)"$/) do |expected_text|
  (red_alert_box_message.should eq(expected_text)).should == true
end

Given(/^I should see the green alert box error message "(.*?)"$/) do |expected_text|
  (green_alert_box_message.should eq(expected_text)).should == true
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
        else fail("Verification option not found")
        end

    page = (var).new
    sleep 1
    page.required_fields.each do |field|
    expect(page.error_on(field)).to be_truthy
  end
end

Given(/^I should see the red error "(.*?)" under the textfield$/) do |expected_text|
  (red_error_under_textfield.should eq(expected_text)).should == true
end

Given(/^I should see the red error "([^"]*)" under the file upload field$/) do |expected_text|
  (red_error_under_file_upload.should eq(expected_text)).should == true
end

Given(/^I should see a red highlighted error on the (.*?)"$/) do |fields|
  case fields
  when "password, confirm password and tos fields"
    page.has_css?(".field-group div:nth-child(2).error")
    page.has_css?(".field-group div:nth-child(3).error")
    page.has_css?(".check-group .error")
  when "confirm password and tos fields"
    page.has_css?(".field-group div:nth-child(3).error")
    page.has_css?(".check-group .error")
  when "tos field"
    page.has_css?(".check-group .error")
  end

  red = "rgba(194, 58, 39, 1)"
  # binding.pry

  border_color = ["border-top-color", "border-right-color", "border-bottom-color", "border-left-color"]
  border_color.each do |border|
    password_field = page.find("#user_password").native.css_value(border)
    (password_field.should eq(red)).should == true
    puts "The password field #{border.upcase} color is: #{password_field}"
  end

  # password_field1 = page.find("#user_password").native.css_value('border-top-color')
  # password_field2 = page.find("#user_password").native.css_value('border-right-color')
  # password_field3 = page.find("#user_password").native.css_value('border-bottom-color')
  # password_field4 = page.find("#user_password").native.css_value('border-left-color')
  #
  # (password_field1.should eq(red)).should == true
  # (password_field2.should eq(red)).should == true
  # (password_field3.should eq(red)).should == true
  # (password_field4.should eq(red)).should == true
  # puts "The password field border right color is: #{password_field2}"
  # puts "The password field border bottom color is: #{password_field3}"
  # puts "The password field border left color is: #{password_field4}"
end
