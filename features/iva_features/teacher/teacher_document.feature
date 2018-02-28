@regression @iva @teacher @desktop @doc
Feature: Teacher verification using document upload

  Background:
    * I set the External Vendor Environment to "Staging"
    * I create a Teacher Doc page object
    * I visit IDP through the "teacher" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I click on the teacher verify using documentation link
    * I select the teacher state "Maryland"
    * I click on the Begin link

  @smoke @delete_current_user_email
  #experian/precise id check
  Scenario: Successful verification
    * I verify using teacher documentation
    * I approve the document in the IDme support tool
    * I should be successfully verified
    * I verify user level properties for "Teacher Doc Upload"

  @delete_current_user_email
  Scenario: Denied attempt for teacher doc upload verification (Error code 64)
    * I submit the teacher doc upload verification form as a "denied" record
    * I should see the error message "We're sorry, but we were unable to verify the information you provided. The information entered must match the information on official records. Note: If you've recently had a name change, try your maiden or prior name."
    * I verify the attempt is marked as "DENIED"

  @delete_experian_user1 @delete_current_user_email
  Scenario: Dupe attempt test for teacher doc upload (Error code 91)
    * I verify using teacher documentation
    * I approve the document in the IDme support tool
    * I clear the session from Authority
    * I create a new account after clearing my old "teacher" session
    * I click on the teacher verify using documentation link
    * I select the teacher state "Maryland"
    * I click on the Begin link
    * I verify using a duplicate "Teacher Doc Upload" record
    * I should see the error message "We’re sorry, but we are unable to verify your credentials with the information you provided."
    * I verify the attempt is marked as "DUPLICATE"

  @delete_current_user_email
  Scenario: Successfully prompt for all required fields
    * I submit the empty Teacher form using "Teacher Document"
    * I should see error messages on required fields for "Teacher Document"

  @delete_experian_user1 @delete_current_user_email
  Scenario: Prompt Error Code 92
    * I verify using teacher documentation
    * I approve the document in the IDme support tool
    * I clear the session from Authority
    * I create a new account after clearing my old "teacher" session
    * I click on the teacher verify using documentation link
    * I select the teacher state "Maryland"
    * I click on the Begin link
    * I submit the teacher doc upload verification form as a "second unique user" record
    * I should see the error message "We’re sorry, but we are unable to verify your credentials with the information you provided."
