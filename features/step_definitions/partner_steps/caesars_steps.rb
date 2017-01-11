Given(/^CAESARS\- I visit homepage and check best room rates$/) do
  visit FigNewton.partners.caesars_hotels

  begin
    find(".fa-times-circle-o").click
  rescue
    puts "Pop up window not available"
  end
  click_link("Book Now",:match => :first)
end


#ok you are going to need to circle back to this because you are encountering essentially two different flows right now.

Given(/^CAESARS\- I verify my "([^"]*)" through ID\.me$/) do |group|

  begin
    find(".idme_container").click
  rescue
    puts "View Alternate Window 1"
  end

  user_group = case group
    when "troop_id"
      "Military"
    when "teacher_id"
      "Teacher"
    when "responder_id"
      "First Responder"
    when "student_id"
      "Student"
  end

  @idp_signin = window_opened_by do
    find(".idme-btn-container div[title=#{user_group}]").click
  end

  within_window @idp_signin do
    sign_in_with_idme_account(group)
  end
end

Given(/^CAESARS\- I verify my "([^"]*)" integration is displayed on the rate calendar page$/) do |group|

  begin #Rescue in place because they have two alternative flows for registering room
    find("#btnSearch").click
  rescue
    puts "Alernative Flow Cue"
  end
    expect(page).to have_css(".troopSwapSidepanel",:text =>"ID.me Up to 10% Room Discount for Military, First Responders, Students & Teachers. What is ID.me? Verification by ID.me")
    expect(page).to have_css(".idmeimg", :visible => true)
end

def find_user_group_text(group)
  case group
     when "troop_id"
      "Military"
     when "teacher_id"
      "Teacher"
     when "responder_id"
      "First Responder"
     when "student_id"
      "Student"
  end
end
