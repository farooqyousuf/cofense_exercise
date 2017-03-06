@regression @iva @responder @desktop
Feature: Responder verification as a police officer

  Background:
    * I visit IDP through the "responder" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I should be on the responder verification screen

  #experian check and also need a unique doc for police
  @smoke @delete_experian_user1 @doc
  Scenario: Successful verification as a police officer
    * I verify using police officer documentation
    * I approve the document in IDme admin
    * I should be successfully verified as "Police Officer"

  Scenario: Denied attempt for police verification
    * I submit the police verification form as a "denied" record
    * I should see the red alert box error message "We're sorry, but we were unable to verify the information you provided. The information entered must match the information on official records. Note: If you've recently had a name change, try your maiden or prior name."
    * I verify the attempt is marked as "DENIED"

  @delete_experian_user1
  Scenario: Dupe attempt test for police officer
    * I verify using police officer documentation
    * I approve the document in IDme admin
    * I clear the session from Authority
    * I create a new account after clearing my old "responder" session
    * I verify using a duplicate "Police Officer" record
    * I should see the red alert box error message "We’re sorry, but we are unable to verify your credentials with the information you provided."
    * I verify the attempt is marked as "DUPLICATE"

  Scenario: Successful prompt for all required fields for Police Officer
    * I submit the empty Police form
    * I should see error messages on required fields for "Police"
