@regression @iva @student @desktop
Feature: Student verification using student credentials

  Background:
    * I visit IDP through the "student" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I should be on the student verification screen

  @smoke @delete_user @wip
  #Unique combo of ssn and dob to verify
  # TODO Ticket# INT-862
  Scenario: Successful verification
    * I verify using student credentials
    * I complete the verification process
    * I should be successfully verified

  Scenario: Denied attempt for student credentials verification
    * I submit the student credentials verification form as a "denied" record
    * I should see the red alert box error message "We're sorry, but our records indicate that you are no longer enrolled in this school. This sometimes occurs to students in a period of transition. If available, please try another verification option, or visit our Support page for more information."
    * I verify the attempt is marked as "DENIED"

Scenario: Duplicate attempt for student credentials verification
    * I submit the student credentials verification form as a "duplicate" record
    * I should see the red alert box error message "We're sorry, but we were unable to confirm your enrollment in the school you selected. If available, please try another verification option, or visit our Support page for more information."
    * I verify the attempt is marked as "DUPLICATE"

  Scenario: Successfully prompt for all required fields
    * I submit the empty Student form using "Student Credentials"
    * I should see error messages on required fields for "Student Credentials"
