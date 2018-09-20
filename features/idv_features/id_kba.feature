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
    * I create "KBAQuestions" page objects
    * I set the External Vendor Environment to "fail kba"
    * I "verify" via KBA
    * I answer the KBA questions
    * I should see the error message "We're sorry, but your information could not be verified. Please ensure that your information was entered correctly and try again."
    * I verify the attempt is marked as "PROCESSING"
