@regression @mobile_iva @mobile_military @smoke
Feature: Military Identity Verification via mobile

  Background:
    * I set the External Vendor Environment to "Staging"
    * I create "MilitaryDoc, SupportTool, SupportToolVerificationAttempts, DD214, MilitaryEmail, MilitarySCRA" page objects
    * I open a new window
    * I visit IDP through the "military" policy
    * I click on the Sign Up link
    * I sign up as a new user

  @delete_current_user_email
  Scenario: Successful verification as a Service Member using doc upload
    * I click on the Military Verify by uploading documentation link
    * I click on the Begin link
    * I verify using military documentation for "Service Member"
    * I approve the document in the IDme support tool via mobile
    * I should be successfully verified as "Service Member"
    * I verify user level properties for "Mil Doc Service Member"

  @delete_current_user_email
  Scenario: Successful DD214 verification as a Veteran via documentation
    * I click on the Verify by requesting DD214 link
    * I click on the Begin link
    * I verify using DD214 information for "Veteran" via "document"
    * I should be successfully verified as "Veteran"
    * I verify user level properties for "DD214 Vet via document"

  @delete_current_user_email
  Scenario: Succesful verification with a military email as Service Member
    * I verify using military email information for "Service Member"
    * I submit the verification code for "Military Email"
    * I should be successfully verified as "Service Member"
    * I verify user level properties for "Mil Email Service Member"

  @delete_current_user_email
  Scenario: Successful verification as Service Member using SCRA credentials
    * I click on the Verify using a government service record link
    * I click on the Begin link
    * I verify using SCRA for "Service Member"
    * I should be successfully verified as "Service Member"
    * I verify user level properties for "SCRA Service Member"
