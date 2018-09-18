@regression @iva @student @desktop
Feature: Canadian Student verification using student credentials

  Background:
    * I set the External Vendor Environment to "Staging"
    * I create "StudentCanada, AdminUsers, AdminTool, AdminTeacherVerifs" page objects
    * I visit IDP through the "student_canada" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I click on the Begin link

  @smoke @delete_current_user_email
  #Unique combo of ssn and dob to verify
  # TODO Ticket# INT-862
  Scenario: Successful verification
    * I submit the Canadian student verification form as a "unique" record
    * I approve the document in the IDme support tool
    * I should be successfully verified
    * I verify user level properties for "Canadian Student"

  @delete_current_user_email
  Scenario: Successfully prompt for all required fields
    * I submit the empty student canadian form
    * I should see error messages on required fields for "Canadian Student"

  @delete_current_user_email
  Scenario: Denied attempt for Canadian Student verification (CST0102)
    * I submit the Canadian student verification form as a "denied" record
    * I deny the document in the IDme support tool
    * I should see the error message "We’re sorry, but we are unable to verify your student status using the document you provided. Please see our Support page for document specifications, or try another verification option."
    * I verify the attempt is marked as "DENIED"
