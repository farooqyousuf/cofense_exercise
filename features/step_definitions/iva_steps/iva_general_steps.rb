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
    step 'I submit the EMT Document Upload form as a "duplicate" record'
  end
end
