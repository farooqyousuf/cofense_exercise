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
  when "other"
    #this
  end
end
