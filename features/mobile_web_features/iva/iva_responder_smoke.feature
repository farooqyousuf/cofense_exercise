@regression @mobile_iva @desktop @smoke
Feature: Responder verification smoke tests

  Background:
    * I set the External Vendor Environment to "Staging"
    * I create "DocEMT, SupportTool, SupportToolDocs, NationalEMT, StateDocEMT, StateLookupEMT, DocFirefighter, PBFirefighter, Police" page objects
    * I open a new window
    * I visit IDP through the "responder" policy
    * I click on the Sign Up link
    * I sign up as a new user

  @delete_current_user_email
  Scenario: Successful EMT verification with doc upload
    * I click on the Verify using EMT Doc link
    * I click on the Begin link
    * I verify using EMT doc upload
    * I approve the document in the IDme support tool via mobile
    * I should be successfully verified as "EMT"
    * I verify user level properties for "EMT Doc"

  @delete_current_user_email
  Scenario: Successful EMT national verification
    * I click on the Verify using EMT National link
    * I click on the Begin link
    * I verify using nationally certified EMT credentials
    * I should be successfully verified as "EMT"
    * I verify user level properties for "EMT National"

  @delete_current_user_email
  Scenario: Successful verification with EMT state doc upload
    * I click on the Verify using EMT State Doc link
    * I click on the Begin link
    * I verify using state EMT doc upload
    * I approve the document in the IDme support tool via mobile
    * I should be successfully verified as "EMT"
    * I verify user level properties for "EMT State Doc"

  @delete_current_user_email
  Scenario: Successful verification with EMT state lookup
    * I click on the Verify using EMT State Lookup link
    * I click on the Begin link
    * I verify using EMT state lookup
    * I approve the document in the IDme support tool via mobile
    * I should be successfully verified as "EMT"
    * I verify user level properties for "EMT State Lookup"

  @delete_current_user_email
  Scenario: Successful verification as a Firefighter using doc upload
    * I click on the No I am not ProBoard certified link
    * I click on the Begin link
    * I verify using firefighter documentation
    * I approve the document in the IDme support tool via mobile
    * I should be successfully verified as "Firefighter"
    * I verify user level properties for "Firefighter Doc"

  @delete_current_user_email
  Scenario: Successful verification as a ProBoard Firefighter
    * I click on the Yes I am ProBoard certified link
    * I click on the Begin link
    * I verify using a ProBoard Firefighter
    * I should be successfully verified as "Firefighter"
    * I verify user level properties for "Firefighter ProBoard"

  @delete_current_user_email
  Scenario: Successful verification as a police officer
    * I click on the Verify as a state certified Police Officer
    * I click on the Begin link
    * I verify using police officer documentation
    * I approve the document in the IDme support tool via mobile
    * I should be successfully verified as "Police Officer"
    * I verify user level properties for "Police"
