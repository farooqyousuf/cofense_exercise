@regression @desktop @iva
Feature: IVA verification using document upload

  Background:
    * I create "SupportTool, SupportToolVerificationAttempts, AdminTool, AdminSettings, MilitaryDoc" page objects
    * I set the External Vendor Environment to "Staging"
    * I visit IDP through the "military" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I should be on the military verification screen

  @delete_current_user_email
  Scenario: Denied document upload for html document type
    * I click on the Military Verify by uploading documentation link
    * I click on the Begin link
    * I generate a unique "html" doc
    * I verify using military "test_html.html" documentation for Service Member
    * I should see the red error "is not a valid document" under the textfield
    * I verify that a document was not uploaded

  @delete_current_user_email
  Scenario: Denied document upload for wpd document type
    * I click on the Military Verify by uploading documentation link
    * I click on the Begin link
    * I generate a unique "wpd" doc
    * I verify using military "test_wpd.wpd" documentation for Service Member
    * I should see the red error "is not a valid document" under the textfield
    * I verify that a document was not uploaded

  @delete_current_user_email
  Scenario: Denied document upload for odt document type
    * I click on the Military Verify by uploading documentation link
    * I click on the Begin link
    * I generate a unique "odt" doc
    * I verify using military "test_odt.odt" documentation for Service Member
    * I should see the red error "is not a valid document" under the textfield
    * I verify that a document was not uploaded

  @delete_current_user_email
  Scenario: Denied document upload for document type converted from txt to jpg
    * I click on the Military Verify by uploading documentation link
    * I click on the Begin link
    * I verify using military "test_txt_to_jpg.jpg" documentation for Service Member
    * I should see the red error "is not a valid document" under the textfield
    * I verify that a document was not uploaded

    @delete_current_user_email
    Scenario: Successful document upload for docx document type
      * I click on the Military Verify by uploading documentation link
      * I click on the Begin link
      * I verify using military "test_docx.docx" documentation for Service Member
      * I should see the red error "is not a valid document" under the textfield
      * I verify that a document was not uploaded
