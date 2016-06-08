Given(/^I visit the waves of honor "([^"]*)" Integration$/) do |park_partner|
  seaworld_promotion_homepage = case park_partner
    when "Seaworld Orlando"                   then FigNewton.partners.seaworld.orlando 
    when "Seaworld San Antonio"               then FigNewton.partners.seaworld.san_antonio
    when "Busch Gardens Tampa"                then FigNewton.partners.seaworld.busch_gardens_tampa
    when "Busch Gardens Williamsburg"         then FigNewton.partners.seaworld.busch_gardens_williamsburg
    when "Seaworld San Diego Teacher"         then FigNewton.partners.seaworld.san_diego_teacher
    when "Seaworld Orlando Teacher"           then FigNewton.partners.seaworld.orlando_teacher
    when "Seaworld San Diego Military"        then FigNewton.partners.seaworld.san_diego_military 
    when "Sesame Place Langhorne"             then FigNewton.partners.seaworld.sesame_place
    when "Aquatica San Diego"                 then FigNewton.partners.seaworld.aquatica_san_diego 
    when "Adventure Island Tampa"             then FigNewton.partners.seaworld.adventure_island_tampa 
    when "Water Country USA Williamsburg"     then FigNewton.partners.seaworld.water_country_usa
    when "Seaworld Orlando Veteran"           then FigNewton.partners.seaworld.orlando_veteran
    when "Busch Gardens Tampa Veteran"        then FigNewton.partners.seaworld.busch_gardens_tampa_veteran
    when "Busch Gardens Williamsburg Veteran" then FigNewton.partners.seaworld.busch_gardens_williamsburg_veteran
    when "Sesame Place Langhorne Veteran"     then FigNewton.partners.seaworld.sesame_place_veteran
    end 
  visit seaworld_promotion_homepage
end

Given(/^I log in with my Id\.me military account$/) do
  idp_signin = window_opened_by do
    find(".IDmeLoginButton").click
  end

  within_window idp_signin do
    sign_in_with_idme
  end
end


Given(/^I verify that my "([^"]*)" service member Complimentary tickets are available$/) do |seaworld_park|

  cart_id = case seaworld_park
    when "Seaworld San Antonio"           then "_oi20180"
    when "Seaworld Orlando"               then "_oi30086"
    when "Busch Gardens Tampa"            then "_oi30179"
    when "Busch Gardens Williamsburg"     then "_oi26707"
    when "Seaworld San Diego Military"    then "_oi4450"
    when "Sesame Place Langhorne"         then "_oi26744"
    when "Aquatica San Diego"             then "_oi4452"
    when "Adventure Island Tampa"         then "_oi30181"
    when "Water Country USA Williamsburg" then "_oi26708"
    when "Seaworld Orlando Veteran"       then "_oi4883"
    
    end
    
  if seaworld_park == "Seaworld San Antonio" 
    ticket_cart_amt = "1 Other $0.00"
  elsif seaworld_park == "Sesame Place Langhorne"
    ticket_cart_amt = "1 Guest $0.00"
  else 
    ticket_cart_amt = "1 Adult $0.00"
  end

  sleep 2
  page.evaluate_script("document.getElementsByClassName('#{cart_id}')[0].childNodes[1].childNodes[1].style.opacity = 10")
  first(".content-maincontent-ticketbox-tixchoose-inner").first(".first").select("1",:from =>"selOrderItemCount")
  first(".content-maincontent-ticketbox-add2cart").click 
  expect(page).to have_css(".cartItems tr:nth-child(2)",:text =>ticket_cart_amt)
end

Given(/^I log in with my Id\.me teacher account$/) do
  step "I log in with my Id.me military account"
end

Given(/^I verify that my orlando teacher discount tickets$/) do
  sleep 2 #need because otherwise encounter (Selenium::WebDriver::Error::JavascriptError) JS is undefined

  page.execute_script("document.getElementsByClassName('_oi19006')[0].childNodes[1].childNodes[1].style.opacity = 10") #orlando
  first(".content-maincontent-ticketbox-tixchoose-inner").first(".first").select("1",:from =>"selOrderItemCount")
  first(".content-maincontent-ticketbox-add2cart").click

  ticket_price_total = find(".cartSubTotal").find(".last").text
  #discount amount is hard-coded because full amount is not disclosed
  
  expect(ticket_price_total).to eql("$0.00")
end

Given(/^I verify that my san diego teacher discount tickets$/) do
  sleep 2 #need because otherwise encounter (Selenium::WebDriver::Error::JavascriptError) JS is undefined

  page.execute_script("document.getElementsByClassName('_oi20134')[0].childNodes[1].childNodes[1].style.opacity = 10") #allow you select tickets because opacity is set to 0
  first(".content-maincontent-ticketbox-tixchoose-inner").first(".first").select("1",:from =>"selOrderItemCount")
  first(".content-maincontent-ticketbox-add2cart").click

  ticket_price_total = find(".cartSubTotal").find(".last").text
  #discount amount is hard-coded because full amount is not disclosed
end

Given(/^I log in with my Id\.me veteran account$/) do
  idp_signin = window_opened_by do
    find(".IDmeLoginButton").click
  end

  within_window idp_signin do
    sign_in_with_idme_veteran
  end
end

Given(/^I verify that my "([^"]*)" discount tickets are available$/) do |seaworld_park|

  cart_id = case seaworld_park
  when "Seaworld Orlando Veteran"           then '_oi4883'
  when "Busch Gardens Williamsburg Veteran" then '_oi11735'
  when "Sesame Place Langhorne Veteran"     then '_oi23014'
  end

  sleep 2 #without this sleep the execute_script doesn't pick up the cart_id variable
  page.execute_script("document.getElementsByClassName('#{cart_id}')[0].childNodes[1].childNodes[1].style.opacity = 10") #allow you select tickets because opacity is set to 0
  first(".content-maincontent-ticketbox-tixchoose-inner").first(".first").select("1",:from =>"selOrderItemCount")
  first(".content-maincontent-ticketbox-add2cart").click
  sleep 2
  if seaworld_park == "Sesame Place Langhorne Veteran" 
    expect(page).to have_css("header[class='tagName']",:text =>"Veteran's Discount Admission")
  elsif seaworld_park == "Busch Gardens Williamsburg Veteran"
    expect(page).to have_css("header[class='tagName']",:text =>"Busch Gardens Single-Day Ticket")
  else 
    expect(page).to have_css("header[class='tagName']",:text =>"SeaWorld Orlando 2016 Fun Card Price:")
  end 

  #veteran pages discounts are hard-coded 
  if seaworld_park == "Busch Gardens Williamsburg Veteran"
    expect(page).to have_css(".cartSubTotal  td:nth-child(2)",:text =>"$53.94")
  elsif seaworld_park == "Sesame Place Langhorne Veteran"
    expect(page).to have_css(".cartSubTotal  td:nth-child(2)",:text =>"$32.50")
  else
    expect(page).to have_css(".cartSubTotal  td:nth-child(2)",:text =>"$49.50")
  end 
end

