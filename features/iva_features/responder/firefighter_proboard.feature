@regression @iva @responder
Feature: Responder verification as a ProBoard Firefighter

  Background:
    * I visit IDP through the "responder" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I should be on the responder verification screen

  @smoke @delete_user
  Scenario: Successful verification as a ProBoard Firefighter
    * I verify using a ProBoard Firefighter
    * I complete the verification process
    * I should be successfully verified as "Firefighter"

Scenario: Successful prompt for all required fields for ProBoard Firefighter
    * I submit the empty ProBoard Firefighter form
    * I should see error messages on required fields for "ProBoard Firefighter"
