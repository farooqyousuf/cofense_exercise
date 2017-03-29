@regression @idp @social_media @paypal @desktop
Feature: IDP Paypal Login

  Background:
    * I visit IDP through the "shop" policy

  @delete_paypal_user
  Scenario: Create and login with a new Paypal account
    * I login with Paypal
    * I complete the new Wallet account linking process
    * I should be successfully authenticated using "Paypal"

