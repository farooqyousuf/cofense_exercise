@regression @iva @teacher @desktop
Feature: Teacher verification using state lookup

  Background:
    * I set the External Vendor Environment to "Staging"
    * I create "AdminUsers, TeacherDoc, AdminTool" page objects
    * I create a Teacher Lookup page object
    * I visit IDP through the "teacher" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I click on the verify using teacher state lookup link

  @smoke @delete_current_user_email
  #unique combo of ssn/dob
  Scenario: Successful verification with no license and no ssn
    * I select the teacher state "Delaware"
    * I click on the Begin link
    * I verify using teacher credentials with "no license and no ssn"
    * I approve the document in the IDme support tool
    * I should be successfully verified
    * I verify user level properties for "Teacher State Lookup - No License/No SSN"

  @delete_current_user_email
  Scenario: Successful verification with no license and short ssn
    * I select the teacher state "New Mexico"
    * I click on the Begin link
    * I verify using teacher credentials with "no license and short ssn"
    * I approve the document in the IDme support tool
    * I should be successfully verified
    * I verify user level properties for "Teacher State Lookup - No License/Short SSN"

  @delete_current_user_email
  Scenario: Successful verification with license and no ssn
    * I select the teacher state "Michigan"
    * I click on the Begin link
    * I verify using teacher credentials with "license and no ssn"
    * I approve the document in the IDme support tool
    * I should be successfully verified
    * I verify user level properties for "Teacher State Lookup - License/No SSN"

  @delete_current_user_email
  Scenario: Successful verification with license and short ssn
    * I select the teacher state "Alabama"
    * I click on the Begin link
    * I verify using teacher credentials with "license and short ssn"
    * I approve the document in the IDme support tool
    * I should be successfully verified
    * I verify user level properties for "Teacher State Lookup - License/Short SSN"

  @delete_current_user_email
  Scenario: Denied attempt for teacher lookup verification (Error code 112)
    * I select the teacher state "Delaware"
    * I click on the Begin link
    * I submit the teacher lookup verification form as a "denied" record
    * I deny the document in the IDme support tool
    * I should see the multi-line error message:
    """
    We’re sorry, but we are unable to verify your teacher status using the information you provided. Please double-check your information for errors and try again.

    Also note that only licensed, classroom teachers are eligible. For additional help, please visit our Support page.
    """
    * I verify the attempt is marked as "DENIED"

  @delete_current_user_email
  Scenario: Successfully prompt for all required fields for license and short ssn
    * I select the teacher state "Alabama"
    * I click on the Begin link
    * I submit the empty Teacher form using "Teacher Lookup Alabama"
    * I should see error messages on required fields for "Teacher Lookup Alabama"

  @delete_current_user_email
  Scenario: Successfully prompt for all required fields for no license and no ssn form
    * I select the teacher state "Delaware"
    * I click on the Begin link
    * I submit the empty Teacher form using "Teacher Lookup Delaware"
    * I should see error messages on required fields for "Teacher Lookup Delaware"

  @delete_current_user_email
  Scenario: Successfully prompt for all required fields for license and no ssn form
    * I select the teacher state "Michigan"
    * I click on the Begin link
    * I submit the empty Teacher form using "Teacher Lookup Michigan"
    * I should see error messages on required fields for "Teacher Lookup Michigan"

  @delete_current_user_email
  Scenario: Successfully prompt for all required fields for no license and short ssn form
    * I select the teacher state "New Mexico"
    * I click on the Begin link
    * I submit the empty Teacher form using "Teacher Lookup New Mexico"
    * I should see error messages on required fields for "Teacher Lookup New Mexico"
