Given(/^CAESARS\- I visit homepage and check best room rates$/) do
  visit FigNewton.partners.caesars_hotels
  find(".cet-dialog-close-box").click #for pop-up modal upon visit 

  click_link "Check Best Rates"
end

Given(/^CAESARS\- I verify my military account through ID\.me$/) do
  @idp_signin = window_opened_by do
    find(".idme-btn-primary-sm-Troop-main").click
  end

  within_window @idp_signin do
    sign_in_with_idme_account("troop_id")
  end
end

Given(/^CAESARS\- I verify my military integration is displayed on the rate calendar page$/) do
  expect(page).to have_css(".id-me-bx",:text =>"Additional Military Discount applied through")
  expect(page).to have_css(".troopSwapSidepanel",:text =>"ID.me Up to 15% Room Discount for Military, First Responders, Students & Teachers. What is ID.me? Verification by ID.me")
end

Given(/^CAESARS\- I choose a room date and verify the military discount on the modal$/) do
  find(".cal-table div:nth-child(2) div:nth-child(3)").click 
  expect(page).to have_css("#idme",:text =>"Additional Military Discount applied through ID.me")
  
  find(".rate-table dl:nth-child(1) .cfive").click 
  expect(page).to have_css(".troopSwapSidepanel",:text =>"ID.me Up to 15% Room Discount for Military, First Responders, Students & Teachers. What is ID.me? Verification by ID.me")
end

Given(/^CAESARS\- I book a room and verify my military discount has been applied$/) do
  first(".hotel-list #A1").click 
  expect(page).to have_css(".title dd:nth-child(3)",:text => "Military Discount: 10% - Applied")
  #NOTE: Caesears doesn't disclose their promotional discount amounts so cannot at this time confirm discount being applied
end
