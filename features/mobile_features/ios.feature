@ios @android
Feature: iOS Smoke Tests

  Background:
    * I visit "MarketplaceLandingPage"

  Scenario: Successful login
    * I click on SignIn link
    * I scroll to the bottom of the page
    * I login as a "Unverified" user
    * I should be on the Shop Homepage

  Scenario: Access Sign Up screen
    * I click on the Sign up link
    * I scroll to the bottom of the page


