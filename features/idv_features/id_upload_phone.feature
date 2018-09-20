@regression @idv
Feature: Identity Verification by taking a picture of your ID from phone upload

  Background:
    * I create "AdminTool, AdminSettings, IDVPhone, IDVComputer, IDVKba, IDmeBase, SupportTool, SupportToolVerificationAttempts" page objects
    * I visit IDP through the au10tix_light policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I click on "Verify using my driver's license"
    * I click on the Take a picture with my phone link

  @smoke @delete_current_user_email
  Scenario: Successful verification with Imagery via phone upload
    * I generate a unique "png" doc
    * I set the External Vendor Environment to "verify via Imagery"
    * I "verify with Imagery" via phone using a mocked driver's license
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
  Scenario: Successful KBA after failed documentation for Identity verification
    * I create "KBAQuestions" page objects
    * I generate a unique "png" doc
    * I set the External Vendor Environment to "fail documentation/successful kba"
    * I trigger KBA after failed documentation for IDV via phone
    * I "verify" KBA via phone
    * I answer the KBA questions
    * I authorize the attribute release
    * I should be successfully verified as "Identity"
    * I verify user level properties for "Identity"

  @delete_current_user_email
  Scenario: Failed document verification via phone upload
    * I generate a unique "png" doc
    * I set the External Vendor Environment to "fail documentation"
    * I "fail documentation" via phone using a mocked driver's license
    * I should see the error message for identity verification "We're sorry, the driver's license you submitted could not be verified. Please try again. You'll now have the option to submit the back of your license, which should make the process easier."
    * I verify the attempt is marked as "PROCESSING"

  @delete_current_user_email
  Scenario: Failed experian for Identity verification via phone upload
    * I generate a unique "png" doc
    * I set the External Vendor Environment to "fail experian"
    * I "fail experian" via phone using a mocked driver's license
    * I should see the error message "We're sorry, but your information could not be verified. Please ensure that your information was entered correctly and try again."
    * I verify the attempt is marked as "PROCESSING"

  @delete_current_user_email
  Scenario: Fail KBA questions after failed documentation for Identity verification
    * I create "KBAQuestions" page objects
    * I generate a unique "png" doc
    * I set the External Vendor Environment to "fail documentation"
    * I trigger KBA after failed documentation for IDV via phone
    * I "verify" KBA via phone
    * I answer the KBA questions
    * I should see the error message "We're sorry, but your information could not be verified. Please ensure that your information was entered correctly and try again."
    * I verify the attempt is marked as "PROCESSING"

  @delete_idv_experian_user @delete_current_user_email
  Scenario: Dupe experian attempt test for Imagery
    * I generate a unique "png" doc
    * I set the External Vendor Environment to "verify via Imagery"
    * I "verify with Imagery" via phone using a mocked driver's license
    * I should be successfully verified as "Identity"
    * I submit dupe identity verification attempt via phone
    * I should see the error message "We’re sorry, it appears you have already verified your identity on a different account. Please sign in using your existing credentials."
    * I verify the attempt is marked as "DUPLICATE"

  @delete_current_user_email
  Scenario: Successfully prompt for all required fields for Identity Verification
    * I set the External Vendor Environment to "verify via Imagery"
    * I "submit empty documents" via phone using a mocked driver's license
    * I verify the identity verification document submit button is disabled on upload from phone screen
    * I "submit documents" via phone using a mocked driver's license
    * I close current tab
    * I submit empty identity verification form for ssn
    * I should see error messages on required fields for "Identity Verification"

  @delete_current_user_email
  Scenario: Edit information for Identity Verification
    * I generate a unique "png" doc
    * I set the External Vendor Environment to "verify via Imagery"
    * I "submit documents" via phone using a mocked driver's license
    * I close current tab
    * I submit identity verification ssn form
    * I edit "Personal Information" info
    * I verify that "Personal Information" info was updated
    * I edit "Address" info
    * I verify that "Address" info was updated
    * I edit "Phone" info
    * I verify that "Home Phone" info was updated
    * I verify that "All + Home Phone" info was updated
    * I submit the edited info form
    * I answer the KBA questions
    * I authorize the attribute release
    * I should be successfully verified as "Identity"
    * I verify updated identity verification info for "phone"
    * I verify user level properties for "Identity"
