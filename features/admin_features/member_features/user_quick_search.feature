@admin @user @regression
Feature: Search users by email using admin tool

  Scenario: Verify user was searched by email
    * I visit the user quick search page
    * I search user by "email"
    * I verify that the user was searched by "email"

  Scenario: Verify user was searched by full name
    * I visit the user quick search page
    * I search user by "full_name"
    * I verify that the user was searched by "full_name"

  Scenario: Verify user was searched by first name
    * I visit the user quick search page
    * I search user by "first_name"
    * I verify that the user was searched by "first_name"
