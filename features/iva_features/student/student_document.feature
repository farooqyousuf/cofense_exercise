@regression @iva @student @desktop
Feature: Student verification using document upload

Background:
    * I visit IDP through the "student" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I should be on the student verification screen

  @smoke @delete_experian_user1 @doc
  #unique dob/ssn and vetted by Experian/PreciseID, have to use their test data
  Scenario: Successful verification
    * I verify using student documentation
    * I approve the document in IDme admin
    * I should be successfully verified

  Scenario: Denied attempt for student doc upload verification (Error code 56)
    * I submit the student doc upload verification form as a "denied" record
    * I should see the red alert box error message "We're sorry, but we were unable to verify the information you provided. The information entered must match the information on official records. Note: If you've recently had a name change, try your maiden or prior name."
    * I verify the attempt is marked as "DENIED"

  @delete_experian_user1 @delete_current_username
  Scenario: Dupe attempt test for student doc upload (Error code 88)
    * I verify using student documentation
    * I approve the document in IDme admin
    * I clear the session from Authority
    * I create a new account after clearing my old "student" session
    * I verify using a duplicate "Student Doc Upload" record
    * I should see the red alert box error message "We’re sorry, but we are unable to verify your credentials with the information you provided."
    * I verify the attempt is marked as "DUPLICATE"

  Scenario: Successfully prompt for all required fields
    * I submit the empty Student form using "Student Document"
    * I should see error messages on required fields for "Student Document"

  @delete_experian_user1 @delete_current_username
  Scenario: Prompt Error Code 89
    * I verify using student documentation
    * I approve the document in IDme admin
    * I clear the session from Authority
    * I create a new account after clearing my old "student" session
    * I submit the student doc upload verification form as a "second unique user" record
    * I should see the red alert box error message "We’re sorry, but we were unable to verify your credentials with the document you provided. Please see our Support page for document specifications, or try another verification option."

