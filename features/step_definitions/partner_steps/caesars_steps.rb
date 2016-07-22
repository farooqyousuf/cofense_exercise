Given(/^CAESARS\- I visit homepage and check best room rates$/) do
  visit FigNewton.partners.caesars_hotels
  find(".cet-dialog-close-box").click #for pop-up modal upon visit 

  click_link "Check Best Rates"
end

Given(/^CAESARS\- I verify my "([^"]*)" through ID\.me$/) do |group|
  user_group = case group
    when "troop_id"
      ".idme-btn-primary-sm-Troop-main"
    when "teacher_id"
      ".idme-btn-primary-sm-Teacher"
    when "responder_id"
      ".idme-btn-primary-sm-Responder"
    when "student_id"
      ".idme-btn-primary-sm-Student"
  end 

  @idp_signin = window_opened_by do
    find(user_group).click 
  end 

  within_window @idp_signin do 
    sign_in_with_idme_account(group)
  end 
end

Given(/^CAESARS\- I verify my "([^"]*)" integration is displayed on the rate calendar page$/) do |group|
   user_group_text = case group
     when "troop_id"
      "Military"
     when "teacher_id"
      "Teacher"
     when "responder_id"
      "First Responder"
     when "student_id"
      "Student"
   end 

  expect(page).to have_css(".id-me-bx",:text =>"Additional #{user_group_text} Discount applied through")
  expect(page).to have_css(".troopSwapSidepanel",:text =>"ID.me Up to 15% Room Discount for Military, First Responders, Students & Teachers. What is ID.me? Verification by ID.me")
end

Given(/^CAESARS\- I choose a room date and verify the "([^"]*)" discount on the modal$/) do |group|
  user_group_text = case group
     when "troop_id"
      "Military"
     when "teacher_id"
      "Teacher"
     when "responder_id"
      "First Responder"
     when "student_id"
      "Student"
  end 

  find(".cal-table div:nth-child(2) div:nth-child(3)").click 
  expect(page).to have_css("#idme",:text =>"Additional #{user_group_text} Discount applied through ID.me")
  
  find(".rate-table dl:nth-child(1) .cfive").click 
  expect(page).to have_css(".troopSwapSidepanel",:text =>"ID.me Up to 15% Room Discount for Military, First Responders, Students & Teachers. What is ID.me? Verification by ID.me")
end

Given(/^CAESARS\- I book a room and verify my "([^"]*)" discount has been applied$/) do |group|
  user_group_text = case group
     when "troop_id"
      "Military"
     when "teacher_id"
      "Teacher"
     when "responder_id"
      "First Responder"
     when "student_id"
      "Student"
  end 

  first(".hotel-list #A1").click 
  expect(page).to have_css(".title dd:nth-child(3)",:text => "#{user_group_text} Discount: 10% - Applied")
  #NOTE: Caesears doesn't disclose their promotional discount amounts so cannot at this time confirm discount being applied
end
