@regression @iva @responder @desktop
Feature: Responder verification as a firefighter using document upload

  Background:
    * I visit IDP through the "responder" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I should be on the responder verification screen

  @smoke @delete_experian_user1 @doc
  # combo of experian/precise id check and unique doc
  Scenario: Successful verification as a Firefighter using doc upload
    * I generate a unique doc
    * I verify using firefighter documentation
    * I approve the document in IDme admin
    * I should be successfully verified as "Firefighter"

  @delete_current_username
  Scenario: Denied attempt for firefighter doc upload verification
    * I submit the firefighter doc upload verification form as a "denied" record
    * I should see the red alert box error message "We're sorry, but we were unable to verify the information you provided. The information entered must match the information on official records. Note: If you've recently had a name change, try your maiden or prior name."
    * I verify the attempt is marked as "DENIED"

  @delete_experian_user1 @delete_current_username
  Scenario: Dupe attempt test for fireman doc upload
    * I generate a unique doc
    * I verify using firefighter documentation
    * I approve the document in IDme admin
    * I clear the session from Authority
    * I create a new account after clearing my old "responder" session
    * I verify using a duplicate "Fireman Doc Upload" record
    * I should see the red alert box error message "We’re sorry, but we are unable to verify your credentials with the information you provided."
    * I verify the attempt is marked as "DUPLICATE"

  Scenario: Successful prompt for all required fields for Firefighter Doc Upload
    * I submit the empty Firefighter doc upload form
    * I should see error messages on required fields for "Firefighter doc upload"
