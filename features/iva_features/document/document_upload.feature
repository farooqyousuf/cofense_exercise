@regression @desktop @iva
Feature: IVA verification using document upload

  Background:
    * I visit IDP through the "military" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I should be on the military verification screen

  @delete_current_username
  Scenario: Successful document upload
    * I verify using military documentation for "Service Member"
    * I verify that a document was successfully uploaded

  @delete_current_username
  Scenario: Successfully prompt for required document upload
    * I submit the military document form for "Service Member"
    * I should see the red error "Please select a file to upload" under the file upload field