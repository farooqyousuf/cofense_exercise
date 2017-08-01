Given(/^I verify user level properties for "([^"]*)"$/) do |affiliation|
  visit_admin_users_in_new_window
  sleep 3
  all('td')[0].text
  all('td')[0].click #click on the very first user in the table

  elements = all("td.center.short")
  actual_levels = []

  case affiliation
  when "Government"
    indexes = [0, 3, 6]
    expected_levels = IVAGovernment.new.govt_user_property_levels
  when "DD214 Vet via SCRA"
    indexes = [0, 3, 6, 9, 12]
    expected_levels = DD214.new.dd214_vet_scra_user_property_levels
  when "DD214 Vet via document"
    indexes = [0, 3, 6, 9, 12]
    expected_levels = DD214.new.dd214_vet_doc_user_property_levels
  when "DD214 Next of Kin Deceased Vet", "DD214 Legal Guardian"
    indexes = [0, 3, 6]
    expected_levels = DD214.new.dd214_family_user_property_levels
  when "Mil Doc Service Member", "Mil Doc Veteran", "Mil Doc Retiree"
    indexes = [0, 3, 6, 9, 12, 15, 18, 21, 24]
    expected_levels = MilitaryDoc.new.mil_doc_service_member_user_property_levels
  when "Mil Doc Mil Spouse", "Mil Doc Mil Family"
    indexes = [0, 3, 6]
    expected_levels = MilitaryDoc.new.mil_doc_mil_family_user_property_levels
  when "Mil Email Service Member"
    indexes = [0, 3, 6]
    expected_levels = MilitaryEmail.new.mil_email_service_member_user_property_levels
  end

  #builds the actual_levels array according to whichever numbers array is selected in the case statement above
  indexes.each do |i|
    actual_levels << elements[i].text.to_i
  end

  expect(expected_levels).to eq(actual_levels)
  puts "Expected User Property Levels: #{expected_levels}"
  puts "Actual User Property Levels: #{actual_levels}"
end
