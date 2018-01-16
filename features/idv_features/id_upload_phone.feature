@regression @idv
Feature: Identity Verification by taking a picture of your ID from phone upload

  Background:
    * I create "AdminTool, AdminSettings, IDV" page objects
    * I visit IDP through the "au10tix_light" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I set up multi-factor authentication

  @delete_current_user_email
  Scenario: Successful verification with Confirm.io via phone upload
    * I generate a unique "png" doc
    * I set the External Vendor Environment to "verify via Confirm.io"
    * I click on the verify by uploading driver's license link
    * I click on the Take a picture with my phone link
    * I "verify with Confirm.io" via phone using a mocked driver's license
    * I should be successfully verified as "Identity"
    * I verify user level properties for "Identity"
