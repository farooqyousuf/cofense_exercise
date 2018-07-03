@regression @desktop @iva
Feature: IVA verification using document upload

  Background:
    * I create "SupportTool, SupportToolDocs, AdminSettings, AdminTool, MilitaryDoc" page objects
    * I set the External Vendor Environment to "Staging"
    * I visit IDP through the "military" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I should be on the military verification screen

  @delete_current_user_email
  Scenario: Successful document upload
    * I click on the Military Verify by uploading documentation link
    * I click on the Begin link
    * I verify using military documentation for "Service Member"
    * I verify that a document was successfully uploaded

  @delete_current_user_email
  Scenario: Successfully prompt for required document upload
    * I click on the Military Verify by uploading documentation link
    * I click on the Begin link
    * I submit the military document form for "Service Member"
    * I should see the red error "Please select a file to upload" under the file upload field
