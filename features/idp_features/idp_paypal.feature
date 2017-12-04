@regression @idp @social_media @paypal @desktop
Feature: IDP Paypal Login

  Background:
    * I visit IDP through the "shop" policy

  @wip @delete_paypal_user #Logging into Paypal is currently disabled until IDme establishes a new developer account with them
  Scenario: Create and login with a new Paypal account
    * I login with Paypal
    * I complete the new Wallet account linking process
    * I should be successfully authenticated using "Paypal"

  Scenario: Prompt error message when attempting to login with Paypal account
    * I click Paypal link
    * I should see the blue alert box error message "We are working to resolve signing in to ID.me with Paypal. We will notify affected users once its been resolved."
