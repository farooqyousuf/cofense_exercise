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
  Scenario: Successful verification with Confirm.io
    * I generate a unique "png" doc
    * I set the External Vendor Environment to "verify via Confirm.io"
    * I "verify via Confirm.io" using a mocked driver's license
    * I should be successfully verified as "Identity"
    * I verify user level properties for "Identity"

  @delete_current_user_email
  Scenario: Successful verification with AU10TIX
    * I generate a unique "png" doc
    * I set the External Vendor Environment to "verify via AU10TIX"
    * I "verify via AU10TIX" using a mocked driver's license
    * I should be successfully verified as "Identity"
    * I verify user level properties for "Identity"
