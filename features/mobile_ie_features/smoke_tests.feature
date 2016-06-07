@ios @android @ie
Feature: Basic Smoke Tests for IDP and IVA

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

  Scenario: Successfully prompt for all required fields
    * I submit the empty government form
    * I should see error messages on required fields for "Government"

