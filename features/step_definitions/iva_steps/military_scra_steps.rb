Given(/^I verify using SCRA for "([^"]*)"$/) do |affiliation|
  MilitarySCRA.new.verify(affiliation: affiliation, type: "unique")
end

Given(/^I submit the empty SCRA form for "([^"]*)"$/) do |group|
  MilitarySCRA.new.verify(affiliation: group, populate: false)
end

Given(/^I submit the military scra verification form as a "([^"]*)" record$/) do |type|
  MilitarySCRA.new.verify(affiliation: "Service Member", type: type)
end

Given(/^Multi\-spouse: I verify "([^"]*)" spouse via "([^"]*)"(?: is not allowed to verify)?$/) do |number, method|
    step 'I visit IDP through the "military" policy'
    step 'I click on the Sign Up link'
    step 'I sign up as a new user'

  if method == "scra"
    case number
      when "first" then
        step 'I verify using SCRA for "Military Spouse"'
        step 'I complete the verification process'
        step 'I clear the session from Authority'
      when "second" then
        step 'I verify using SCRA for "Military Spouse"'
        step 'I should see the red alert box error message "We\'re sorry, but we were unable to verify your military status with the information you provided. Please utilize the name you held when discharged, and be sure to use an active duty date from the middle of your period of service. Note that Reservists, National Guardsmen, and all pre-1985 Veterans, must verify by uploading documentation. For additional information, please see our Support page."'
        step 'I clear the session from Authority'
    end
  end
end


Given(/^Multi\-family: I verify "([^"]*)" family via "([^"]*)"(?: is not allowed to verify)?$/) do |number, method|
    step 'I visit IDP through the "military" policy'
    step 'I click on the Sign Up link'
    step 'I sign up as a new user'

  if method == "scra"
    case number
      when "first", "second", "third" then
        step 'I verify using SCRA for "Military Multi Family"'
        step 'I complete the verification process'
        step 'I clear the session from Authority'
      when "fourth" then
        step 'I verify using SCRA for "Military Multi Family"'
        step 'I should see the red alert box error message "We\'re sorry, but we were unable to verify your military status with the information you provided. Please utilize the name you held when discharged, and be sure to use an active duty date from the middle of your period of service. Note that Reservists, National Guardsmen, and all pre-1985 Veterans, must verify by uploading documentation. For additional information, please see our Support page."'
        step 'I clear the session from Authority'
    end
  end

end
