@regressoion @idv
Feature: Identity Verification by answering KBA questions

  Background:
    * I create "KBAQuestions, IDVComputer, AdminSettings, AdminTool, SupportTool, SupportToolVerificationAttempts" page objects
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
