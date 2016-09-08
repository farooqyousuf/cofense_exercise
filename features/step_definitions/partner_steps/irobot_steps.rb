Given(/^IROBOT\- I visit the iRobot HLP page$/) do
	visit FigNewton.partners.irobot.hlp_page
end

Given(/^IROBOT\- I log in with my Id\.me military account$/) do
  idp_signin = window_opened_by do
    find(".idme-trigger").click
  end

  within_window idp_signin do
    sign_in_with_idme
  end
end

Given(/^IROBOT\- I select a iRobot Roomba and add to checkout$/) do
	sleep 1
	visit "http://store.irobot.com/default/roomba-vacuuming-robot-vacuum-irobot-roomba-980/R980020.html"
	find("#add-to-cart").click 
end

Given(/^IROBOT\- I verify that my IDme military discount has been applied$/) do
	visit "https://store.irobot.com/default/cart"
	expect(page).to have_css(".promo-adjustment",:text =>"ID.me shoppers: Save Up to 15% on Select iRobot Products")
	original_product_amt_string = find(".price-sales").text
	actual_product_discounted_amt_string = find(".price-adjusted-total").text
	discount_applied = verify_discount(original_product_amt_string,actual_product_discounted_amt_string,".15",:verify_discount_total => true)
end