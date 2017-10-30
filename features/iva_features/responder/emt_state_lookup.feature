@regression @iva @responder @desktop @emt
Feature: Responder verification as an EMT using state lookup

  Background:
    * I create a EMT State Lookup page object
    * I visit IDP through the "responder" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I click on the Verify using EMT State Lookup link
    * I click on the Begin link

  @smoke @delete_experian_user1
  Scenario: Successful verification with EMT state lookup
    * I verify using EMT state lookup
    * I approve the document in the IDme support tool
    * I should be successfully verified as "EMT"
    * I verify user level properties for "EMT State Lookup"

  @delete_current_username
  Scenario: Denied attempt for emt state lookup verification (Error code B1102)
    * I submit the emt state lookup verification form as a "denied" record
    * I should see the error message "We're sorry, but we were unable to verify the information you provided. The information entered must match the information on official records. Note: If you've recently had a name change, try your maiden or prior name."
    * I verify the attempt is marked as "DENIED"

  @delete_experian_user1 @delete_current_username
  Scenario: Dupe attempt test for emt state lookup (Error code B1100)
    * I verify using EMT state lookup
    * I approve the document in the IDme support tool
    * I clear the session from Authority
    * I create a new account after clearing my old "responder" session
    * I click on the Verify using EMT State Lookup link
    * I click on the Begin link
    * I verify using a duplicate "EMT State Lookup" record
    * I should see the error message "We’re sorry, but we are unable to verify your EMT status with the information you provided."
    * I verify the attempt is marked as "DUPLICATE"

  Scenario: Successful prompt for all required fields for EMT state lookup
    * I submit the empty EMT state lookup form
    * I should see error messages on required fields for "EMT state lookup"
