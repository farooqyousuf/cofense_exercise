Given(/^I verify user level properties for "([^"]*)"$/) do |affiliation|
  visit_admin_users_in_new_window
  sleep 3
  all('td')[0].text
  all('td')[0].click #click on the very first user in the table

  elements = all("td.center.short")
  actual_levels = Array.new

  case affiliation
  when "IVAGovernment"
    indexes = [0,3,6]
    method = "user_property_levels"
  when "DD214 Vet via SCRA"
    affiliation = "DD214"
    indexes = [0,3,6,9,12]
    method = "vet_scra_user_property_levels"
  when "DD214 Vet via document"
    affiliation = "DD214"
    indexes = [0,3,6,9,12]
    method = "vet_doc_user_property_levels"
  when "DD214 Next of Kin Deceased Vet"
    affiliation = "DD214"
    indexes = [0,3,6]
    method = "next_of_kin_deceased_vet"
  when "DD214 Legal Guardian"
    affiliation = "DD214"
    indexes = [0,3,6]
    method = "legal_guardian"
  end

  #builds the actual_levels array according to whichever numbers array is selected in the case statement above
  indexes.each do |index|
    actual_levels.push(elements[index].text.to_i)
  end
  affiliation_class = Object.const_get(affiliation).new #converts a string text into a class name
  expected_levels = affiliation_class.send(method)

  expect(actual_levels.should == expected_levels).to be_truthy
  puts "Expected User Property Levels: #{expected_levels}"
  puts "Actual User Property Levels: #{actual_levels}"
end
