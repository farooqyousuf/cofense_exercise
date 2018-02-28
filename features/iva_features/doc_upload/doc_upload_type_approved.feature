@regression @desktop @iva
Feature: IVA verification using document upload

  Background:
    * I create "SupportTool, SupportToolDocs, AdminTool, AdminSettings" page objects
    * I set the External Vendor Environment to "Staging"
    * I visit IDP through the "military" policy
    * I create a Military Document page object
    * I click on the Sign Up link
    * I sign up as a new user
    * I should be on the military verification screen

  @delete_current_user_email
  Scenario: Successful document upload for jpeg document type
    * I click on the Military Verify by uploading documentation link
    * I click on the Begin link
    * I generate a unique "jpeg" doc
    * I verify using military "test_jpeg.jpeg" documentation for Service Member
    * I verify that a "jpeg" document was successfully uploaded

  @delete_current_user_email
  Scenario: Successful document upload for png document type
    * I click on the Military Verify by uploading documentation link
    * I click on the Begin link
    * I generate a unique "png" doc
    * I verify using military "test_png.png" documentation for Service Member
    * I verify that a "png" document was successfully uploaded

  @delete_current_user_email
  Scenario: Successful document upload for jpg document type
    * I click on the Military Verify by uploading documentation link
    * I click on the Begin link
    * I generate a unique "jpg" doc
    * I verify using military "test_jpg.jpg" documentation for Service Member
    * I verify that a "jpg" document was successfully uploaded

  @delete_current_user_email
  Scenario: Successful document upload for tiff document type
    * I click on the Military Verify by uploading documentation link
    * I click on the Begin link
    * I generate a unique "tiff" doc
    * I verify using military "test_tiff.tiff" documentation for Service Member
    * I verify that a "tiff" document was successfully uploaded

  @delete_current_user_email
  Scenario: Successful document upload for gif document type
    * I click on the Military Verify by uploading documentation link
    * I click on the Begin link
    * I generate a unique "gif" doc
    * I verify using military "test_gif.gif" documentation for Service Member
    * I verify that a "gif" document was successfully uploaded

  @delete_current_user_email
  Scenario: Successful document upload for pdf document type
    * I click on the Military Verify by uploading documentation link
    * I click on the Begin link
    * I verify using military "test_pdf.pdf" documentation for Service Member
    * I verify that a "pdf" document was successfully uploaded
