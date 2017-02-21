@admin @user @regression
Feature: Search users by email using admin tool

  Background:
    * I visit the user quick search page

  Scenario: Successful verification user was searched by email
    * I verify that the user was searched by "email"

  Scenario: Successful verification user was searched by full name
    * I verify that the user was searched by "full_name"

  Scenario: Successful verification user was searched by first name
    * I verify that the user was searched by "first_name"
