@regression @idp @social_media @google
Feature: IDP Google Login

  Background:
    * I visit IDP through the "marketplace" policy

  @delete_google_user
  Scenario: Create and login with a new Google account
    * I login with Google
    * I complete the new Wallet account linking process
    * I should be successfully authenticated using "Google"
