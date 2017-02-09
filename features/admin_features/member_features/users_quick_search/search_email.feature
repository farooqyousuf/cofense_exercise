@admin @user @regression
Feature: Search users by email using admin tool

  Scenario: Verify searched user
    * I visit the user quick search page
    * I search user by "email"
    * I verify that the user was searched
