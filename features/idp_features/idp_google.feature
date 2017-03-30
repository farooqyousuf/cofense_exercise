@regression @idp @social_media @google @desktop
Feature: IDP Google Login

  Background:
    * I visit IDP through the "shop" policy

  @delete_google_user
  Scenario: Create and login with a new Google account
    * I login with Google
    * I complete the new Wallet account linking process
    * I should be successfully authenticated using "Google"
