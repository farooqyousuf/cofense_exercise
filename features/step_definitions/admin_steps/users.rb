Given(/^I verify user level properties for "([^"]*)"$/) do |affiliation|

  visit_admin_users_in_new_window
  sleep 3
  all('td')[0].text
  all('td')[0].click #click on the very first user in the table

  elements = all("td.center.short")
  levels = Array.new

  case affiliation
  when "Government"
    levels.insert(elements[0].text.to_i, elements[3].text.to_i, elements[6].text.to_i)
    puts "Actual Levels: #{levels}"
    puts "Expected Levels: #{IVAGovernment.new.user_property_levels}"
    #expect(levels).to include(IVAGovernment.new.user_property_levels)
    expect(levels.should == IVAGovernment.new.user_property_levels).to be_truthy
  when "responder"
    # step 'I visit IDP through the "responder" policy'
  when "student"
    # step 'I visit IDP through the "student" policy'
  when "teacher"
    # step 'I visit IDP through the "teacher" policy'
  end
end
