Given(/^I should be successfully verified(?: as "(.*)")?$/) do |group|
  flag = ["LOA1", "LOA2", "LOA3"].include?(group)
  #save oauth client token for idp and iva tests
  @oauth_client.save_token(current_url)

  if flag == true
    expect(@oauth_client.verify_loa_scope(group)).to eq(true)
  else
    expect(@oauth_client.verified?).to eq(true)
    expect(@oauth_client.has_affiliation?(group)).to eq(true) if group
  end
end

Given(/^I verify using a duplicate "([^"]*)" record$/) do |affiliation|
  case affiliation
  when "DD214"
    step 'I verify using DD214 information for "Veteran"'
  when "SCRA"
    step 'I verify using SCRA for "Service Member"'
  when "Military Document"
    step 'I submit the military document verification form as a "duplicate" record'
  when "EMT State Lookup"
    step 'I submit the emt state lookup verification form as a "duplicate" record'
  when "EMT National"
    step 'I submit the emt national verification form as a "duplicate" record'
  when "Fireman Doc Upload"
    step 'I submit the firefighter doc upload verification form as a "duplicate" record'
  when "Police Officer"
    step 'I submit the police verification form as a "duplicate" record'
  when "Student Doc Upload"
    step 'I submit the student doc upload verification form as a "duplicate" record'
  when "Teacher Doc Upload"
    step 'I submit the teacher doc upload verification form as a "duplicate" record'
  when "Proboard Fireman"
    step 'I submit the proboard firefighter verification form as a "duplicate" record'
  when "EMT Document Upload"
    step 'I submit the state EMT Document Upload form as a "duplicate" record'
  end
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

   elsif method == "mil doc"
     case number
     when "first" then
        step 'I verify using military documentation for "Military Spouse"'
        step 'I approve the document in IDme admin'
        step 'I complete the verification process'
        step 'I clear the session from Authority'
     when "second" then
        step 'I verify using military documentation for "Military Spouse"'
        step 'I should see the red alert box error message "We’re sorry, but we are unable to verify your credentials with the information you provided."'
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

  elsif method == "mil doc"
    case number
    when "first", "second", "third" then
      step 'I verify using military documentation for "Military Family"'
      step 'I approve the document in IDme admin'
      step 'I complete the verification process'
      step 'I clear the session from Authority'
    when "fourth" then
      step 'I verify using military documentation for "Military Family"'
      step 'I should see the red alert box error message "We’re sorry, but we are unable to verify your credentials with the information you provided."'
      step 'I clear the session from Authority'
    end
  end

end
