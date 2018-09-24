@regressoion @idv
Feature: Identity Verification by answering KBA questions

  Background:
    * I create "KBAQuestions, IDVComputer, IDVKba, AdminSettings, AdminTool, SupportTool, SupportToolVerificationAttempts" page objects
    * I visit IDP through the au10tix_light policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I click on "Verify by answering questions"

  @smoke @delete_current_user_email
  Scenario: Successful verification with KBA
    * I set the External Vendor Environment to "successful kba"
    * I "verify" via KBA
    * I answer the KBA questions
    * I click on "Verify"
    * I authorize the attribute release
    * I should be successfully verified as "Identity"
    * I verify user level properties for "Identity"

  @delete_idv_experian_user @delete_current_user_email
  Scenario: Dupe experian attempt test for Imagery
    * I set the External Vendor Environment to "successful kba"
    * I "verify" via KBA
    * I answer the KBA questions
    * I click on "Verify"
    * I authorize the attribute release
    * I should be successfully verified as "Identity"
    * I verify user level properties for "Identity"
    * I submit dupe identity verification attempt via kba
    * I should see the error message "We’re sorry, it appears you have already verified your identity on a different account. Please sign in using your existing credentials."
    * I verify the attempt is marked as "DUPLICATE"

  @delete_current_user_email
  Scenario: Failed experian with KBA
    * I set the External Vendor Environment to "fail experian"
    * I "fail experian" via KBA
    * I should see the error message "We're sorry, but your information could not be verified. Please ensure that your information was entered correctly and try again."
    * I verify the attempt is marked as "PROCESSING"

  @delete_current_user_email
  Scenario: Fail KBA questions
    * I set the External Vendor Environment to "fail kba"
    * I "verify" via KBA
    * I answer the KBA questions
    * I should see the error message "We're sorry, but your information could not be verified. Please ensure that your information was entered correctly and try again."
    * I verify the attempt is marked as "PROCESSING"

  @delete_current_user_email
  Scenario: Edit information for Identity Verification
    * I set the External Vendor Environment to "successful kba"
    * I "submit information" via KBA
    * I edit "Personal Information" info
    * I verify that "Personal Information" info was updated
    * I edit "Address" info
    * I verify that "Address" info was updated
    * I edit "Phone" info
    * I verify that "Phone" info was updated
    * I verify that "All" info was updated
    * I submit the edited info form
    * I answer the KBA questions
    * I click on "Verify"
    * I authorize the attribute release
    * I should be successfully verified as "Identity"
    * I verify updated identity verification info for "kba"
    * I verify user level properties for "Identity"
