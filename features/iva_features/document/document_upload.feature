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
    * I should have successfully verified that a document was uploaded
