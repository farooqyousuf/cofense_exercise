@regression @iva @student @desktop @doc
Feature: Student verification using document upload

Background:
    * I create a Student Doc page object
    * I visit IDP through the "student" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I click on the Verify by uploading documentation link
    * I click on the Begin link

  @smoke @delete_current_user_email
  #unique dob/ssn and vetted by Experian/PreciseID, have to use their test data
  Scenario: Successful verification
    * I verify using student documentation
    * I approve the document in the IDme support tool
    * I should be successfully verified
    * I verify user level properties for "Student Doc Upload"

  @delete_current_user_email
  Scenario: Denied attempt for student doc upload verification (Error code 56)
    * I submit the student doc upload verification form as a "denied" record
    * I should see the error message "We're sorry, but we were unable to verify the information you provided. The information entered must match the information on official records. Note: If you've recently had a name change, try your maiden or prior name."
    * I verify the attempt is marked as "DENIED"

  @delete_experian_user1 @delete_current_user_email
  Scenario: Dupe attempt test for student doc upload (Error code 88)
    * I verify using student documentation
    * I approve the document in the IDme support tool
    * I clear the session from Authority
    * I create a new account after clearing my old "student" session
    * I click on the Verify by uploading documentation link
    * I click on the Begin link
    * I verify using a duplicate "Student Doc Upload" record
    * I should see the error message "We’re sorry, but we are unable to verify your credentials with the information you provided."
    * I verify the attempt is marked as "DUPLICATE"

  @delete_current_user_email
  Scenario: Successfully prompt for all required fields
    * I create a Student Creds page object
    * I submit the empty Student form using "Student Document"
    * I should see error messages on required fields for "Student Document"

  @delete_experian_user1 @delete_current_user_email
  Scenario: Prompt Error Code 89
    * I verify using student documentation
    * I approve the document in the IDme support tool
    * I clear the session from Authority
    * I create a new account after clearing my old "student" session
    * I click on the Verify by uploading documentation link
    * I click on the Begin link
    * I submit the student doc upload verification form as a "second unique user" record
    * I should see the error message "We’re sorry, but we are unable to verify your credentials with the information you provided."
