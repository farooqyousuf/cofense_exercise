@admin @user @regression
Feature: Search users by email using admin tool

  Scenario: Verify searched user
    * I visit user quick search page
    * I search user by email
    * I verify user was searched
