@regression @iva @responder @desktop
Feature: Responder verification as a firefighter using document upload

  Background:
    * I visit IDP through the "responder" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I click on the No I am not ProBoard certified link
    * I click on the Begin link

  @smoke @delete_experian_user1 @doc
  # combo of experian/precise id check and unique doc
  Scenario: Successful verification as a Firefighter using doc upload
    * I generate a unique doc
    * I verify using firefighter documentation
    * I approve the document in IDme admin
    * I should be successfully verified as "Firefighter"
    * I verify user level properties for "Firefighter Doc"

  @delete_current_user_email
  Scenario: Denied attempt for firefighter doc upload verification (Error code 45)
    * I submit the firefighter doc upload verification form as a "denied" record
    * I should see the error message "We're sorry, but we were unable to verify the information you provided. The information entered must match the information on official records. Note: If you've recently had a name change, try your maiden or prior name."
    * I verify the attempt is marked as "DENIED"

  @delete_experian_user1 @delete_current_user_email
  Scenario: Dupe attempt test for fireman doc upload (Error code 85)
    * I generate a unique doc
    * I verify using firefighter documentation
    * I approve the document in IDme admin
    * I clear the session from Authority
    * I create a new account after clearing my old "responder" session
    * I click on the No I am not ProBoard certified link
    * I click on the Begin link
    * I verify using a duplicate "Fireman Doc Upload" record
    * I should see the error message "We’re sorry, but we are unable to verify your credentials with the information you provided."
    * I verify the attempt is marked as "DUPLICATE"

 @delete_experian_user1 @delete_current_user_email
 Scenario: Prompt Error Code 86
    * I generate a unique doc
    * I verify using firefighter documentation
    * I approve the document in IDme admin
    * I clear the session from Authority
    * I create a new account after clearing my old "responder" session
    * I click on the No I am not ProBoard certified link
    * I click on the Begin link
    * I submit the firefighter doc upload verification form as a "second unique user" record
    * I should see the error message "We’re sorry, but we were unable to verify your credentials with the document you provided. Please see our Support page for document specifications, or try another verification option."

  Scenario: Successful prompt for all required fields for Firefighter Doc Upload
    * I submit the empty Firefighter doc upload form
    * I should see error messages on required fields for "Firefighter doc upload"
