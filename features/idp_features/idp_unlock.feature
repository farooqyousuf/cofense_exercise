@regression @idp @oauth
Feature: User account lock and unlock

  Background:
    * I visit the OAuth Tester
    * I select the "Marketplace" policy
    * I click on the Sign up link
    * I sign up as a new user
    * I logout of the OAuth Tester
    * I visit the OAuth Tester
    * I select the "Marketplace" policy
    
  Scenario: User Account locked due to failed logins
    * I lockout my account
    * I click on the unlock account link
    * I unlock my account