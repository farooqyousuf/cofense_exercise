@regression @idv
Feature: Identity Verification by taking a picture of your ID from a mobile device

  Background:
    * I create "AdminTool, AdminSettings, IDV" page objects
    * I visit IDP through the "au10tix_light" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I set up multi-factor authentication
    * I click on the verify by uploading driver's license link

  @delete_current_user_email
  Scenario: Successful verification with Confirm.io
    * I generate a unique "png" doc
    * I set the External Vendor Environment to "verify via Confirm.io"
    * I "verify with Confirm.io" via phone using a mocked driver's license
    * I authorize the attribute release
    * I should be successfully verified as "Identity"
    * I verify user level properties for "Identity"
