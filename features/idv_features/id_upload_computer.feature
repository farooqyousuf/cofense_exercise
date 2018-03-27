@regression @idv
Feature: Identity Verification by uploading an ID from the computer

  Background:
    * I create "AdminTool, AdminSettings, IDV" page objects
    * I visit IDP through the "au10tix_light" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I set up multi-factor authentication
    * I click on the verify by uploading driver's license link
    * I click on the Upload from my computer link

  @ignore @delete_current_user_email
  Scenario: Successful verification with Confirm.io
    * I generate a unique "png" doc
    * I set the External Vendor Environment to "verify via Confirm.io"
    * I "verify via Confirm.io" via computer using a mocked driver's license
    * I authorize the attribute release
    * I should be successfully verified as "Identity"
    * I verify user level properties for "Identity"

  @delete_current_user_email
  Scenario: Successful verification with AU10TIX
    * I generate a unique "png" doc
    * I set the External Vendor Environment to "verify via AU10TIX"
    * I "verify via AU10TIX" via computer using a mocked driver's license
    * I authorize the attribute release
    * I should be successfully verified as "Identity"
    * I verify user level properties for "Identity"

  @delete_current_user_email
  Scenario: Failed documentation for Identity verification
    * I generate a unique "png" doc
    * I set the External Vendor Environment to "fail documentation"
    * I "fail documentation" via computer using a mocked driver's license
    * I should see the error message for identity verification "We're sorry, the driver's license you submitted could not be verified. Please try again. You'll now have the option to submit the back of your license, which should make the process easier."
    * I verify the attempt is marked as "PROCESSING"

  @delete_current_user_email
  Scenario: Failed experian for Identity verification
    * I generate a unique "png" doc
    * I set the External Vendor Environment to "fail experian"
    * I "fail experian" via computer using a mocked driver's license
    * I should see the error message "We're sorry, but your information could not be verified. Please ensure that your information was entered correctly and try again."
    * I verify the attempt is marked as "PROCESSING"
