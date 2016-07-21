Given(/^CAMP\- I check the Camp Saver ID\.me Verify Instruction Page$/) do
	visit FigNewton.partners.camp_saver.verify_idme_page
	expect(page).to have_css("h2", :text =>"CampSaver.com Offers 20% Off Regular Price For Military, First Responders & Students")
end

Given(/^CAMP\- I click Shop now and verify redirect to camp saver partner$/) do
	find(:link,:href=>"/").click 
	expect(page.current_url).to eql("http://www.campsaver.com/")
end

Given(/^CAMP\- I visit the product page$/) do
	visit FigNewton.partners.camp_saver.product_page 
end

Given(/^CAMP\- I add product to the cart and checkout$/) do
	select "Seafoam - Large: $39.95",:from => "super_attributes_single_select"
	find(".btn-cart").click
	find(".checkout").click 
end

Given(/^CAMP\- I apply the Troop ID discount$/) do
  idp_signin = window_opened_by { find(".idme-connect-trigger").click }

  within_window idp_signin do
    sign_in_with_idme
  end
end

Given(/^CAMP\- I verify the Troop ID discount has been applied$/) do
  pending # Write code here that turns the phrase above into concrete actions
end