@regression @idp @social @google
Feature: IDP Google Login

  Background:
    * I visit the OAuth Tester
    * I select the "Marketplace" policy

  @oauth_tester_logout @delete_google_user
  Scenario: Create and login with a new Google account
    * I login with Google
    * I should be successfully authenticated using "Google"
