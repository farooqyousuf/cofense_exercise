@test @ui
Feature: Automating some basic elements from a dummy UI site using Chrome as the test browser.

Background:
    * I visit the UltimateQA website

  @radio
  Scenario: Testing the Other radio button
    * I select the Other radio button in the Radio Buttons section and output the state to console

  @dropdown
  Scenario: Testing the Dropdown menu
    * I select Audi in the Dropdown section and output the value to console

  @table
  Scenario: Testing the Table with Unique ID
    * I traverse the Table with unique ID in the Table section and output the Title and Salary to console