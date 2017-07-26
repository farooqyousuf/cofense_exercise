Given(/^I verify user level properties for "([^"]*)"$/) do |affiliation|
  visit_admin_users_in_new_window
  sleep 3
  all('td')[0].text
  all('td')[0].click #click on the very first user in the table

  elements = all("td.center.short")
  actual_levels = []

  case affiliation
  when "Government"
    indexes = [0,3,6]
    expected_levels = IVAGovernment.new.user_property_levels
  when "DD214 Vet via SCRA"
    indexes = [0,3,6,9,12]
    expected_levels = DD214.new.vet_scra_user_property_levels
  when "DD214 Vet via document"
    indexes = [0,3,6,9,12]
    expected_levels = DD214.new.vet_doc_user_property_levels
  when "DD214 Next of Kin Deceased Vet"
    indexes = [0,3,6]
    expected_levels = DD214.new.next_of_kin_deceased_vet_property_levels
  when "DD214 Legal Guardian"
    indexes = [0,3,6]
    expected_levels = DD214.new.legal_guardian_property_levels
  end

  #builds the actual_levels array according to whichever numbers array is selected in the case statement above
  indexes.each do |i|
    actual_levels << elements[i].text.to_i
  end

  expect(expected_levels).to eq(actual_levels)
  puts "Expected User Property Levels: #{expected_levels}"
  puts "Actual User Property Levels: #{actual_levels}"
end
