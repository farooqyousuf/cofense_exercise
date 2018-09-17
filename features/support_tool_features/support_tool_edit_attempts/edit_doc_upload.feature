@support
Feature: Edit document upload verification attempt

  Background:
    * I create "MilitaryDoc, SupportTool, SupportToolEditAttemps, SupportToolVerificationAttempts" page objects
    * I visit IDP through the "military" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I click on the Military Verify by uploading documentation link
    * I click on the Begin link
    * I verify using military documentation for "Veteran"

  Scenario: Successfully update the verification attempt for document upload
    * I update the "military" verification attempt within the IDme support tool
    * I verify the updated "military" verification attempt within the IDme support tool
