Given(/^CS \- I add an item to the cart$/) do
  visit FigNewton.partners.caesars_hotels
  click_link "Check Best Rates"
  # this is UP TO 15% which means it'll be different which means that you are going to need
  #to make sure they're variable
  find("#datalist").first("a",:text => "ROOMS & RATES").click
end

Given(/^CS \- I apply the Troop ID discount$/) do
  @idp_signin = window_opened_by do
    first(".idme-btn-container a").native.send_key :return
  end

  within_window @idp_signin do
    sign_in_with_idme
  end
  # note that will need sleep or extended sync selector because visible delay in content loading
  # TODO : add expectations to check first count that discount has been applied here
  expect(page).to have_css(".idmeimg") # Military Discount Applied image
  binding.pry
  expect(find("#roomList").first(".box").find(".troop-promo").text).to eql("+Additional Military Discount")
  find("#roomList").first("a",:text => "BOOK NOW").click
end

Given(/^CS \- I verify the discount has been applied$/) do
  expect(find(".title")).to have_text("Military Discount: 10%")
  #I dont think there is a good way to find the price amount to be set right now?
  #TODO : turns out the new window was incorrect so instead adding expectations to check otherwise
end
