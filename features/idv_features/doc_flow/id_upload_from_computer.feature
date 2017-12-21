@regression @idv
Feature: Identity Verification by uploading an ID from the computer

  Background:
    * I create "AdminTool, AdminSettings, IDV, Consent" page objects
    * I visit IDP through the "au10tix_light" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I set up multi-factor authentication
    * I click on the verify by uploading driver's license link

  @delete_current_user_email
  Scenario: Successful verification with Confirm iO
    * I generate a unique "png" doc
    * I set the External Vendor Environment to "successfully verify confirm iO" within the Admin tool
    * I "successfully verify confirm iO" using a mocked driver's license
    * I should be successfully verified as "Identity"
    * I verify user level properties for "Identity"

  @delete_current_user_email
  Scenario: Successful verification with Au10tix
    * I generate a unique "png" doc
    * I set the External Vendor Environment to "successfully verify au10tix" within the Admin tool
    * I "successfully verify au10tix" using a mocked driver's license
    * I should be successfully verified as "Identity"
    * I verify user level properties for "Identity"
