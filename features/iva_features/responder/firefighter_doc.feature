@regression @iva @responder @desktop @doc
Feature: Responder verification as a firefighter using document upload

  Background:
    * I set the External Vendor Environment to "Staging"
    * I create a Fireman Doc page object
    * I visit IDP through the "responder" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I click on the No I am not ProBoard certified link
    * I click on the Begin link

  @smoke @delete_current_user_email
  # combo of experian/precise id check and unique doc
  Scenario: Successful verification as a Firefighter using doc upload
    * I verify using firefighter documentation
    * I approve the document in the IDme support tool
    * I should be successfully verified as "Firefighter"
    * I verify user level properties for "Firefighter Doc"

  @delete_current_user_email
  Scenario: Denied attempt for firefighter doc upload verification (Error code 45)
    * I submit the firefighter doc upload verification form as a "denied" record
    * I should see the error message "We're sorry, but we are unable to verify the information you provided. The information entered must the information on official records. Note: If you've recently had a name change, try your maiden or prior name."
    * I verify the attempt is marked as "DENIED"

  @delete_experian_user1 @delete_current_user_email
  Scenario: Dupe attempt test for fireman doc upload (Error code 85)
    * I verify using firefighter documentation
    * I approve the document in the IDme support tool
    * I clear the session from Authority
    * I create a new account after clearing my old "responder" session
    * I click on the No I am not ProBoard certified link
    * I click on the Begin link
    * I verify using a duplicate "Fireman Doc Upload" record
    * I should see the error message "We’re sorry, it appears you have already verified your firefighter status on a different account. Please sign in using your existing credentials."
    * I verify the attempt is marked as "DUPLICATE"

  @delete_experian_user1 @delete_current_user_email
  Scenario: Prompt Error Code FRP0500
    * I verify using firefighter documentation
    * I approve the document in the IDme support tool
    * I clear the session from Authority
    * I create a new account after clearing my old "responder" session
    * I click on the No I am not ProBoard certified link
    * I click on the Begin link
    * I submit the firefighter doc upload verification form as a "second unique user" record
    * I should see the error message "We’re sorry, it appears you have already verified your firefighter status on a different account. Please sign in using your existing credentials."

  @delete_current_user_email
  Scenario: Successful prompt for all required fields for Firefighter Doc Upload
    * I submit the empty Firefighter doc upload form
    * I should see error messages on required fields for "Firefighter doc upload"
