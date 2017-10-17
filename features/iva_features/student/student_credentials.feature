@regression @iva @student @desktop
Feature: Student verification using student credentials

  Background:
    * I visit IDP through the "student" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I click on the Verify using your student credentials link
    * I create a Student Creds page object
    * I click on the Begin link

  @smoke @delete_current_user_email
  #Unique combo of ssn and dob to verify
  # TODO Ticket# INT-862
  Scenario: Successful verification
    * I submit the student credentials verification form as a "unique" record
    * I should be successfully verified
    * I verify user level properties for "Student Credentials"

  Scenario: Denied attempt for student credentials verification (Error code 54)
    * I submit the student credentials verification form as a "denied" record
    * I should see the error message "We're sorry, but we were unable to confirm your enrollment in the school you selected. If available, please try another verification option, or visit our Support page for more information."
    * I verify the attempt is marked as "DENIED"

  @delete_current_user_email
  Scenario: Duplicate attempt for student credentials verification (Error code 55)
    * I submit the student credentials verification form as a "duplicate" record
    * I should see the error message "We're sorry, but we were unable to confirm your enrollment in the school you selected. If available, please try another verification option, or visit our Support page for more information."
    * I verify the attempt is marked as "DUPLICATE"

  Scenario: Successfully prompt for all required fields
    * I submit the empty Student form using "Student Credentials"
    * I should see error messages on required fields for "Student Credentials"
