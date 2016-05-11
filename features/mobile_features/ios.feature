@ios
Feature: iOS Smoke Tests

  Background:
    * I visit "MarketplaceLandingPage"

  Scenario: Successful login
    * I click on SignIn link
    * I scroll to the bottom of the page
    * I login as a "Unverified" user

  Scenario: Access Sign Up screen
    * I click on the Sign up link
    * I scroll to the bottom of the page
