@regression @idv
Feature: Identity Verification by taking a picture of your ID from phone upload

  Background:
    * I create "AdminTool, AdminSettings, IDV" page objects
    * I visit IDP through the "au10tix_light" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I click on the verify by uploading driver's license link
    * I click on the Take a picture with my phone link

  @smoke @delete_current_user_email
  Scenario: Successful verification with Obliterate via phone upload
    * I generate a unique "png" doc
    * I set the External Vendor Environment to "verify via Obliterate"
    * I "verify with Obliterate" via phone using a mocked driver's license
    * I should be successfully verified as "Identity"
    * I verify user level properties for "Identity"

  @smoke @delete_current_user_email
  Scenario: Successful verification with AU10TIX via phone upload
    * I generate a unique "png" doc
    * I set the External Vendor Environment to "verify via AU10TIX"
    * I "verify with AU10TIX" via phone using a mocked driver's license
    * I should be successfully verified as "Identity"
    * I verify user level properties for "Identity"

  @delete_current_user_email
  Scenario: Failed document verification via phone upload
    * I generate a unique "png" doc
    * I set the External Vendor Environment to "fail documentation"
    * I "fail documentation" via phone using a mocked driver's license
    * I should see the error message for identity verification "We're sorry, the driver's license you submitted could not be verified. Please try a different image or use another verification method."
    * I verify the attempt is marked as "PROCESSING"
