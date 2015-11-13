
Given(/^NBA \- I add an item to the cart$/) do
  visit "http://store.nba.com/Boston_Celtics_Mens/Mens_Boston_Celtics_Larry_Bird_adidas_Kelly_Green_Hardwood_Classics_Swingman_Jersey"
  if page.has_link?("lightboxSaleCloseLink")
    fanatics_lightbox("NBA")
  end
  click_link "Choose Size S"
  find("#addToCart").click
end

Given(/^NBA \- I apply the Troop ID discount$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^NBA \- I verify the Troop ID discount has been applied$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
