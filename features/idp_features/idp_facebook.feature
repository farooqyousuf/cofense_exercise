@regression @idp
Feature: IDP Facebook Login

  Background:
    * I visit the OAuth Tester
    * I select the "Marketplace" policy

  @oauth_tester_logout
  Scenario: Create and login with a Facebook account
    * I login with Facebook
    * I pry
