@regression @idp @social @facebook
Feature: IDP Facebook Login

  Background:
    * I visit IDP through the "marketplace" policy

  @delete_facebook_user
  Scenario: Create and login with a new Facebook account
    * I login with Facebook
    * I complete the new Wallet account linking process
    * I should be successfully authenticated using "Facebook"

