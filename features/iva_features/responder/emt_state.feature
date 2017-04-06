@regression @iva @responder @desktop @emt
Feature: Responder verification as an EMT using state lookup

  Background:
    * I visit IDP through the "responder" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I should be on the responder verification screen

  @smoke @delete_experian_user1
  Scenario: Successful verification with EMT state lookup
    * I verify using EMT state lookup
    * I approve the EMT verification in IDme admin
    * I should be successfully verified as "EMT"

  Scenario: Denied attempt for emt state lookup verification
    * I submit the emt state lookup verification form as a "denied" record
    * I should see the red alert box error message "We're sorry, but we were unable to verify the information you provided. The information entered must match the information on official records. Note: If you've recently had a name change, try your maiden or prior name."
    * I verify the attempt is marked as "DENIED"

  @delete_experian_user1 @delete_current_username
  Scenario: Dupe attempt test for emt state lookup
    * I verify using EMT state lookup
    * I approve the EMT verification in IDme admin
    * I clear the session from Authority
    * I create a new account after clearing my old "responder" session
    * I verify using a duplicate "EMT State Lookup" record
    * I should see the red alert box error message "We’re sorry, but we are unable to verify your EMT status with the information you provided."
    * I verify the attempt is marked as "DUPLICATE"

  Scenario: Successful prompt for all required fields for EMT state lookup
    * I submit the empty EMT state lookup form
    * I should see error messages on required fields for "EMT state lookup"

  @smoke @delete_experian_user1
  #unique doc and user must pass experian check
  Scenario: Successful verification with EMT state doc upload
    * I generate a unique doc
    * I verify using state EMT doc upload
    * I approve the document in IDme admin
    * I should be successfully verified as "EMT"

  Scenario: Denied attempt for EMT state doc upload verification
    * I submit the state EMT Document Upload form as a "denied" record
    * I should see the red alert box error message "We're sorry, but we were unable to verify the information you provided. The information entered must match the information on official records. Note: If you've recently had a name change, try your maiden or prior name."
    * I verify the attempt is marked as "DENIED"

  @delete_experian_user1 @delete_current_username
  Scenario: Dupe attempt for EMT state document upload
    * I generate a unique doc
    * I verify using state EMT doc upload
    * I approve the document in IDme admin
    * I clear the session from Authority
    * I create a new account after clearing my old "responder" session
    * I verify using a duplicate "EMT Document Upload" record
    * I should see the red alert box error message "We’re sorry, but we are unable to verify your credentials with the information you provided."
    * I verify the attempt is marked as "DUPLICATE"

  Scenario: Successful prompt for all required fields for EMT state doc upload
    * I submit the empty state EMT doc upload form
    * I should see error messages on required fields for "EMT state doc"

