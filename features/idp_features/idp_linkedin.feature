@regression @idp @social_media @linkedin
Feature: IDP LinkedIn Login

  Background:
    * I visit IDP through the "marketplace" policy

  @delete_linkedin_user
  Scenario: Create and login with a new LinkedIn account
    * I login with LinkedIn
    * I complete the new Wallet account linking process
    * I should be successfully authenticated using "LinkedIn"
