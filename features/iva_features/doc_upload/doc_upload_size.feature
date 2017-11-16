@regression @desktop @iva
Feature: IVA verification using document upload of various sizes

  Background:
    * I create "SupportTool, SupportToolDocs" page objects
    * I visit IDP through the "military" policy
    * I create a Military Document page object
    * I click on the Sign Up link
    * I sign up as a new user
    * I should be on the military verification screen

  @delete_current_user_email
  Scenario: Denied document upload for file greater than 16MB
    * I click on the Military Verify by uploading documentation link
    * I click on the Begin link
    * I verify using military "over_16MB" documentation for Service Member
    * I should see the red error "File must be less than 16 MB" under the file upload field
    * I verify that a document was not uploaded
