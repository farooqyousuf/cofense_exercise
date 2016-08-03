Given(/^CAMP\- I check the Camp Saver ID\.me Verify Instruction Page$/) do
	visit FigNewton.partners.camp_saver.verify_idme_page
	expect(page).to have_css("h2", :text =>"CampSaver.com Offers 20% Off Regular Price For Military, First Responders & Students")
	sleep 2
	page.driver.browser.navigate.refresh
end

Given(/^CAMP\- I click Shop now and verify redirect to camp saver partner$/) do
	find(:link,:href=>"/").click 
	expect(page.current_url).to eql("http://www.campsaver.com/")
end

Given(/^CAMP\- I visit the product page$/) do
	visit FigNewton.partners.camp_saver.product_page 
end

Given(/^CAMP\- I add product to the cart and checkout$/) do
	select "Tangerine - Large: $79.95",:from => "super_attributes_single_select"
	find(".btn-cart").click
	find(".checkout").click 
end

Given(/^CAMP\- I apply the Troop ID discount$/) do
  idp_signin = window_opened_by { find(".idme-btn-primary-lg-Troop").click }

  within_window idp_signin do
    sign_in_with_idme_account("troop_id")
  end
end

Given(/^CAMP\- I verify the IDme discount has been applied$/) do
	expect(page).to have_css(".success-msg",:text =>"Successfully verified your affiliation via ID.me")
	original_prudct_amt_string = first("#shopping-cart-table .price_old").text
	actual_product_discount_amt_string = find("#shopping-cart-totals-table tbody tr:nth-child(3) td:nth-child(2)").text 
	discount_applied = verify_discount(original_prudct_amt_string,actual_product_discount_amt_string,".20", :exact_match => true )
	expect(discount_applied).to be(true)
	#expect(page).to have_css("#shopping-cart-table tbody td:nth-child(2) div" ,:text =>"ID.me Group Discount Applied") #08/2/16 : use this matcher when they change over copy
	expect(page).to have_css("#shopping-cart-table tbody td:nth-child(2) div", :text => "Id.me Verify")
end


Given(/^CAMP\- I apply the Responder ID discount$/) do
  idp_signin = window_opened_by { find(".idme-btn-primary-lg-Responder").click }

  within_window idp_signin do
    sign_in_with_idme_account("responder_id")
  end
end

Given(/^CAMP\- I apply the Student ID discount$/) do
  idp_signin = window_opened_by { find(".idme-btn-primary-lg-Student").click }

  within_window idp_signin do
    sign_in_with_idme_account("student_id")
  end
end
