@regression @iva @responder @desktop @emt @doc
Feature: Responder verification as an EMT using document upload

  Background:
    * I create a EMT Document page object
    * I visit IDP through the "responder" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I click on the Verify using EMT Doc link
    * I click on the Begin link

  @delete_current_user_email @smoke
  Scenario: Successful verificaton with doc upload
    * I verify using EMT doc upload
    * I approve the document in the IDme support tool
    * I should be successfully verified as "EMT"
    * I verify user level properties for "EMT Doc"

  @delete_current_user_email
  Scenario: Denied attempt for emt document verification (Error code B1502)
    * I submit the EMT document verification form as a "denied" record
    * I should see the error message "We're sorry, but we were unable to verify the information you provided. The information entered must match the information on official records. Note: If you've recently had a name change, try your maiden or prior name."
    * I verify the attempt is marked as "DENIED"

  @delete_experian_user1 @delete_current_user_email
  Scenario: Dupe user attempt test for emt document (Error code B1500)
    * I verify using EMT doc upload
    * I approve the document in the IDme support tool
    * I clear the session from Authority
    * I create a new account after clearing my old "responder" session
    * I click on the Verify using EMT Doc link
    * I click on the Begin link
    * I submit the EMT document verification form as a "duplicate" record
    * I should see the error message "We’re sorry, but we are unable to verify your credentials with the information you provided."
    * I verify the attempt is marked as "DUPLICATE"

  @delete_experian_user1 @delete_current_user_email
  Scenario: Dupe document attempt test for emt document (Prompt Error Code B1501)
    * I verify using EMT doc upload
    * I approve the document in the IDme support tool
    * I clear the session from Authority
    * I create a new account after clearing my old "responder" session
    * I click on the Verify using EMT Doc link
    * I click on the Begin link
    * I submit the EMT document verification form as a "second unique user" record
    * I should see the error message "We’re sorry, but we are unable to verify your credentials with the information you provided."
