#@regression @shop @shop_cash_back @desktop
Feature: Automating some basic elements from a dummy UI site using Chrome as the test browser.

  Scenario: Automating some basic elements from a dummy UI site
    * I visit "ShopLandingPage"
    * I select the "Other" radio button in the Radio Buttons section and output the state to console
    * I select "Audi" in the Dropdown section and output the value to console
    * I traverse the "Table with unique ID" in the Table section and output the Title and Salary to console