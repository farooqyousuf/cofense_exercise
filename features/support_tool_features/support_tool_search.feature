@support
Feature: Search user by name within the Support tool

  Background:
    * I create "SupportTool" page objects
    * I visit "SupportTool"

  Scenario: Successfully search user by first name
    * I verify that the user was searched with "first_name" using the Support tool

  Scenario: Successfully search user by last name
    * I verify that the user was searched with "last_name" using the Support tool

  Scenario: Successfully search user by full name
    * I verify that the user was searched with "full_name" using the Support tool

  Scenario: Successfully search user by part of the first name
    * I verify that the user was searched with "partial_name" using the Support tool

  Scenario: Successfully search user by full name with uppercase characters
    * I verify that the user was searched with "uppercase_characters" using the Support tool

  Scenario: Successfully search user by last name with an apostrophe
    * I verify that the user was searched with "apostrophe" using the Support tool

  Scenario: Successfully search user by email
    * I verify that the user was searched with "email" using the Support tool

  Scenario: Successfully search user by part of the email
    * I verify that the user was searched with "partial_email" using the Support tool
