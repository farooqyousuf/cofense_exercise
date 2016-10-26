Given(/^JRCIGAR \- I verify the military discount landing page$/) do
	visit FigNewton.partners.jr_cigar_landing_page
	expect(page).to have_css(".page-static-military-discount h1",:text => "Military & First Responder Discount")
	sleep 1
	page.driver.browser.navigate.refresh
	click_link "Log In or Sign Up"
end

Given(/^JRCIGAR \- I login to JR Cigar$/) do
	find("form[name='loginForm'] input[type='email']").set(FigNewton.partners.previous_user)
	find("form[name='loginForm'] input[name='password']").set(FigNewton.partners.password)
	click_button "Log In"
end

Given(/^JRCIGAR \- I add item to the cart$/) do
	visit "https://www.jrcigars.com/cart"
end

Given(/^JRCIGAR \- I verify the IDme discount checkout modal$/) do
	click_link "Military and First Responder Discounts"

	expect(page).to have_css(".modal-body h1", :text =>"Military & First Responder Discount")
	expect(page).to have_css(".idme-btn-container h4",:text =>"GET VERIFIED WITH ID.ME")
	expect(page).to have_css(".idme-btn-alt-lg-Troop",:visible =>true )
	expect(page).to have_css(".idme-btn-alt-lg-Responder",:visible =>true )
end 

Given(/^JRCIGAR \- I login with my military Idme account$/) do
	idp_signin = window_opened_by do
		find(".idme-btn-alt-lg-Troop").click
	end 

	within_window idp_simgnin do
		sign_in_with_idme
	end 
end

Given(/^JRCIGAR \- I verify my IDme military discount has been applied$/) do
	expect(page).to have_css(".coupon-title",:match => :first, :text =>"Coupon 10MILT-AFFILIATES Save $10.84")
	expect(page).to have_css("a[href='#military-discount']",:text => "MILITARY DISCOUNT APPLIES TO YOUR ORDER!")
end

Given(/^JRCIGAR \- I login with my First Responder Idme account$/) do
	idp_signin = window_opened_by do
		find(".idme-btn-alt-lg-Responder").click
	end 

	within_window idp_signin do
		sign_in_with_idme
	end 
end

Given(/^JRCIGAR \- I verify my IDme First Responder discount has been applied$/) do
	visit "https://www.jrcigars.com/cart"
	expect(page).to have_css(".coupon-title",:match => :first, :text =>"Coupon 10MILT-AFFILIATES Save $10.84")
	expect(page).to have_css("a[href='#military-discount']",:text => "MILITARY DISCOUNT APPLIES TO YOUR ORDER!")
end