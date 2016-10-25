Given(/^DELL \- visit HLP page and verify coupon code$/) do
	visit FigNewton.partners.dell_hlp
	find(".idme-trigger").click 
	idp_sign_in = windows.last

	within_window idp_sign_in do 
		sign_in_with_idme
	end 
	click_link "Continue »"
	expect(page.title).to have_text "Welcome to the Member Purchase Program | Dell"
end

# TODO: currently blocked for verifying promocode because of rate limit 
# need to implement full user integration creation and verification first 
# until then just verify hlp integration works 
