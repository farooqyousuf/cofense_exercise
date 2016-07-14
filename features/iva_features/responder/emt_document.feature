@regression @iva @responder @desktop
Feature: Responder verification as an EMT using document upload

  Background:
    * I visit IDP through the "responder" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I should be on the responder verification screen

  @smoke @delete_experian_user1
  #unique doc and user must pass experian check
  Scenario: Successful verification
    * I generate a unique doc
    * I verify using EMT doc upload
    * I approve the document in IDme admin
    * I complete the verification process
    * I should be successfully verified as "EMT"

  Scenario: Denied attempt for EMT Document verification
    * I submit the EMT Document Upload form as a "denied" record
    * I should see the red alert box error message "We're sorry, but we were unable to verify the information you provided. The information entered must match the information on official records. Note: If you've recently had a name change, try your maiden or prior name."
    * I verify the attempt is marked as "DENIED"

 @delete_experian_user1
 Scenario: Dupe attempt for EMT Document Upload
    * I generate a unique doc
    * I verify using EMT doc upload
    * I approve the document in IDme admin
    * I complete the verification process
    * I clear the session from Authority
    * I create a new account after clearing my old "responder" session
    * I verify using a duplicate "EMT Document Upload" record
    * I pry
    * I should see the red alert box error message "We’re sorry, but we are unable to verify your credentials with the information you provided."
    * I verify the attempt is marked as "DUPLICATE"

Scenario: Successful prompt for all required fields for EMT Doc Upload
    * I submit the empty EMT doc upload form
    * I should see error messages on required fields for "EMT doc upload"
