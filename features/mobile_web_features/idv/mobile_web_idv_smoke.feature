@regression @mobile_idv @smoke
Feature: Identity Verification by uploading an ID via mobile

  Background:
    * I create "AdminTool, AdminSettings, IDV" page objects
    * I open a new window
    * I visit IDP through the "au10tix_light" policy
    * I click on the Sign Up link
    * I sign up as a new user

  @delete_current_user_email
  Scenario: Successful verification with Imagery via phone upload
    * I click on the verify by uploading driver's license link via mobile
    * I click on the Take a picture with my phone link
    * I generate a unique "png" doc
    * I set the External Vendor Environment to "verify via Imagery"
    * I "verify with Imagery" via phone using a mocked driver's license
    * I should be successfully verified as "Identity"
    * I verify user level properties for "Identity"

  @delete_current_user_email
  Scenario: Successful verification with AU10TIX via phone upload
    * I click on the verify by uploading driver's license link via mobile
    * I click on the Take a picture with my phone link
    * I generate a unique "png" doc
    * I set the External Vendor Environment to "verify via AU10TIX"
    * I "verify with AU10TIX" via phone using a mocked driver's license
    * I should be successfully verified as "Identity"
    * I verify user level properties for "Identity"

  @delete_current_user_email
  Scenario: Successful verification with Imagery via computer upload
    * I click on the verify by uploading driver's license link via mobile
    * I click on the Upload from my computer link
    * I generate a unique "png" doc
    * I set the External Vendor Environment to "verify via Imagery"
    * I "verify via Imagery" via computer using a mocked driver's license
    * I authorize the attribute release
    * I should be successfully verified as "Identity"
    * I verify user level properties for "Identity"

  @delete_current_user_email
  Scenario: Successful verification with AU10TIX via computer upload
    * I click on the verify by uploading driver's license link via mobile
    * I click on the Upload from my computer link
    * I generate a unique "png" doc
    * I set the External Vendor Environment to "verify via AU10TIX"
    * I "verify via AU10TIX" via computer using a mocked driver's license
    * I authorize the attribute release
    * I should be successfully verified as "Identity"
    * I verify user level properties for "Identity"
