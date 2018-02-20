@regression @iva @responder @desktop
Feature: Responder verification as a ProBoard Firefighter

  Background:
    * I set the External Vendor Environment to "Staging"
    * I create a Fireman ProBoard page object
    * I visit IDP through the "responder" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I click on the Yes I am ProBoard certified link
    * I click on the Begin link

  @smoke @delete_current_user_email
  Scenario: Successful verification as a ProBoard Firefighter
    * I verify using a ProBoard Firefighter
    * I should be successfully verified as "Firefighter"
    * I verify user level properties for "Firefighter ProBoard"

  @delete_current_user_email
  Scenario: Denied attempt for proboard firefighter verification (Error code 28)
    * I submit the proboard firefighter verification form as a "denied" record
    * I should see the error message "We're sorry, but we were unable to verify your firefighter status with the information you provided. Please ensure your name and SSN are entered correctly and try again. For additional information, please see our Support page."
    * I verify the attempt is marked as "DENIED"

 @delete_pb_fireman_user @delete_current_user_email
 Scenario: Dupe attempt test for proboard fireman
    * I verify using a ProBoard Firefighter
    * I clear the session from Authority
    * I create a new account after clearing my old "responder" session
    * I click on the Yes I am ProBoard certified link
    * I click on the Begin link
    * I verify using a duplicate "Proboard Fireman" record
    * I should see the error message "We're sorry, but we were unable to verify your firefighter status with the information you provided. Please ensure your name and SSN are entered correctly and try again. For additional information, please see our Support page."
    * I verify the attempt is marked as "DUPLICATE"

  @delete_current_user_email
  Scenario: Successful prompt for all required fields for ProBoard Firefighter
    * I submit the empty ProBoard Firefighter form
    * I should see error messages on required fields for "ProBoard Firefighter"
