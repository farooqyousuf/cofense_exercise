@regression @idv
Feature: Identity Verification using Au10tix

  Background:
    * I create "AdminTool, AdminSettings, IDV, Consent" page objects
    * I set the External Vendor Environment to "successfully verify au10tix" within the Admin tool
    * I visit IDP through the "au10tix_light" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I set up multi-factor authentication
    * I click on the verify by uploading driver's license link

  @delete_current_user_email
  Scenario: Successful verification with Au10tix
    * I generate a unique doc
    * I verify using a mocked driver's license
    * I should be successfully verified as "Identity"
    * I verify user level properties for "Identity"
