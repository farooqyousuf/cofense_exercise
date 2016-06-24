@regression @iva @teacher @desktop
Feature: Teacher verification using document upload

  Background:
    * I visit IDP through the "teacher" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I should be on the teacher verification screen

  @smoke @delete_experian_user1
  #experian/precise id check
  Scenario: Successful verification
    * I verify using teacher documentation
    * I approve the document in IDme admin
    * I complete the verification process
    * I should be successfully verified

  Scenario: Denied attempt for teacher doc upload verification
    * I submit the teacher doc upload verification form as a "denied" record
    * I "deny" the teacher verification in IDme admin
    * I should see the red alert box error message "We're sorry, but we were unable to verify the information you provided. The information entered must match the information on official records. Note: If you've recently had a name change, try your maiden or prior name."
    * I verify the attempt is marked as "DENIED"

  Scenario: Successfully prompt for all required fields
    * I submit the empty Teacher form using "Teacher Document"
    * I should see error messages on required fields for "Teacher Document"
