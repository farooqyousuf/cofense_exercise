@regression @idp
Feature: IDP Facebook Login

  Background:
    * I visit the OAuth Tester
    * I select the "Marketplace" policy

  @oauth_tester_logout  @delete_facebook_user
  Scenario: Create and login with a new Facebook account
    * I login with Facebook
    * I should be successfully authenticated using "Facebook"
