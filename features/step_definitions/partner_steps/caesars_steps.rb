Given(/^CS \- I add an item to the cart$/) do
  visit "https://www.totalrewards.com/reserve/"
  click_on "btnSearch"
end

Given(/^CS \- I apply the Troop ID discount$/) do
  @idme_window = window_opened_by do
    first(".idme-btn-container a").native.send_key :return
  end

  within_window @idme_window do
    sign_in_with_idme
  end
end

Given(/^CS \- I verify the discount has been applied$/) do
  within_window @idme_window do
    expect(page.has_xpath?("//img[@alt='id.me applied']")).to be true
  end
end
