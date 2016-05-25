Given(/^ATLANTIS \- I visit the military HLP and verify$/) do
	visit FigNewton.partners.atlantis_hlp

	new_window = window_opened_by { find(".idme-trigger").click }

  within_window new_window do
    sign_in_with_idme
  end
end

Given(/^ATLANTIS \- I verify the idme atlantis landing page$/) do
	expect(page).to have_text "Enjoy Military Discounts and More!"
	expect(page.current_url).to eql("http://www.atlantisbahamas.com/idme")
	# expectation confirmed that no visible discounts currently applied
	# so instead just confirm integration worked with landing page
end
