@support
Feature: Search user by name within the Support tool

  Background:
    * I create "SupportTool, SupportToolVerificationAttempts" page objects

  Scenario: Successfully search user by first name
    * I visit "SupportTool"
    * I verify that the user was searched with "first_name" using the Support tool

  Scenario: Successfully search user by last name
    * I visit "SupportTool"
    * I verify that the user was searched with "last_name" using the Support tool

  Scenario: Successfully search user by full name
    *  I visit "SupportTool"
    * I verify that the user was searched with "full_name" using the Support tool

  Scenario: Successfully search user by part of the first name
    * I visit "SupportTool"
    * I verify that the user was searched with "partial_name" using the Support tool

  Scenario: Successfully search user by full name with uppercase characters
    * I visit "SupportTool"
    * I verify that the user was searched with "uppercase_characters" using the Support tool

  Scenario: Successfully search user by last name with an apostrophe
    * I visit "SupportTool"
    * I verify that the user was searched with "apostrophe" using the Support tool

  Scenario: Successfully search user by email
    * I visit "SupportTool"
    * I verify that the user was searched with "email" using the Support tool

  Scenario: Successfully search user by part of the email
    * I visit "SupportTool"
    * I verify that the user was searched with "partial_email" using the Support tool

  Scenario: User is no longer found once removed while logged in
    * I visit IDP through the "military" policy
    * I create "MilitaryEmail" page objects
    * I click on the Sign Up link
    * I sign up as a new user
    * I visit "SupportTool"
    * I verify that the "new_user" was searched using the Support tool
    * I delete the current user
    * I visit "SupportTool"
    * I verify that the new user is no longer found within the Support tool
