Given(/^FE \- I add an item to the cart$/) do
  visit FigNewton.partners.fansedge
  if page.has_link?("lightboxSaleCloseLink")
    fanatics_lightbox("fansedge")
  end
  click_link "Choose Size S"
  find("#addToCart").click
  within(".mbBottomButtonsContainer") do
    click_link "checkout"
  end
end

Given(/^FE \- I apply the Troop ID discount$/) do
  click_link "militaryAndFirstResponderHeaderTitle"
  new_window = window_opened_by { find(".desktopIdMeMilitaryBtn").click }

  within_window new_window do
    sign_in_with_idme
  end
end

Given(/^FE \- I verify the Troop ID discount has been applied$/) do
  expect(find("#desktopIdStatus").text).to eq("Status Verified")
end
