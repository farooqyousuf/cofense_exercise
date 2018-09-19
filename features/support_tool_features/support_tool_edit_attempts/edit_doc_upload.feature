@support
Feature: Edit document upload verification attempt

  Background:
    * I create "MilitaryDoc, SupportTool, SupportToolEditAttempts, SupportToolVerificationAttempts" page objects

  @delete_current_user_email
  Scenario: Successfully update the verification attempt for military document upload
    * I visit IDP through the "military" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I click on the Military Verify by uploading documentation link
    * I click on the Begin link
    * I verify using military documentation for "Veteran"
    * I update the "military" verification attempt within the IDme support tool
    * I verify the updated "military" verification attempt within the IDme support tool

  @delete_current_user_email
  Scenario: Prompt required fields for military document upload
    * I visit IDP through the "military" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I click on the Military Verify by uploading documentation link
    * I click on the Begin link
    * I verify using military documentation for "Veteran"
    * I "remove military name" values within the IDme support tool
    * I verify that the verification attempt shows errors for required fields