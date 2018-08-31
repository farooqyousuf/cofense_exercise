@regression @shop @shop_cash_back @desktop
Feature: Shop "My Cash" cash back page user experience

  Background:
    * I create "ShopLandingPage, ShopCashBackPage" page objects
    * I visit "ShopLandingPage"
    * I click on the Shop "Sign Up" navigation link
    * I sign up as a new user
    * I click on link to view My Cash
    * I verify the new user email

  @smoke @delete_current_user_email
  Scenario: Review the "My Cash" cash back purchases page
    * I verify that the "Cash Back Activity" tab is selected
    * I confirm the cash back summary section is shown
    * I confirm the next payment section is shown
    * I confirm the purchases table is shown
    * I verify the purchases table content for purchases made

  @delete_current_user_email
  Scenario: Review the "My Cash" cash back payments page
    * I click on the Payment History tab
    * I verify that the "Payment History" tab is selected
    * I confirm the cash back summary section is shown
    * I confirm the next payment section is shown
    * I confirm the purchases table is shown
    * I verify the purchases table content for purchases made

  @delete_current_user_email
  Scenario: Verify updating payment information with valid information
    * I confirm that the payment settings dashboard is shown
    * I verify the content within the payment settings modal
    * I update my payment information to receive via Paypal
    * I verify my payment information information was successfully updated

  @delete_current_user_email
  Scenario: Prompt error when updating payment information with invalid information
    * I update my paypal account with an invalid paypal email
    * I see an error message for invalid paypal email
