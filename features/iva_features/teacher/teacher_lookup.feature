@regression @iva @teacher @desktop
Feature: Teacher verification using state lookup

  Background:
    * I visit IDP through the "teacher" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I click on the verify using teacher state lookup link

  @smoke @delete_current_username
  #unique combo of ssn/dob
  Scenario: Successful verification with no license and no ssn
    * I select the teacher state "Delaware"
    * I click on the Begin link
    * I verify using teacher credentials with "no license and no ssn"
    * I "approve" the teacher verification in IDme admin
    * I should be successfully verified

  @delete_current_username
  Scenario: Successful verification with no license and short ssn
    * I select the teacher state "New Mexico"
    * I click on the Begin link
    * I verify using teacher credentials with "no license and short ssn"
    * I "approve" the teacher verification in IDme admin
    * I should be successfully verified

  @delete_current_username
  Scenario: Successful verification with license and no ssn
    * I select the teacher state "Michigan"
    * I click on the Begin link
    * I verify using teacher credentials with "license and no ssn"
    * I "approve" the teacher verification in IDme admin
    * I should be successfully verified

  @delete_current_username
  Scenario: Successful verification with license and short ssn
    * I select the teacher state "Alabama"
    * I click on the Begin link
    * I verify using teacher credentials with "license and short ssn"
    * I "approve" the teacher verification in IDme admin
    * I should be successfully verified

  @delete_current_username
  Scenario: Denied attempt for teacher lookup verification (Error code 112)
    * I select the teacher state "Delaware"
    * I click on the Begin link
    * I submit the teacher lookup verification form as a "denied" record
    * I "deny" the teacher verification in IDme admin
    * I should see the error message "We’re sorry, but we were unable to confirm your status as a teacher using the information you provided. Please double-check your information for errors and try again. Also note that only licensed, classroom teachers are eligible. For additional help, please visit our Support page. Thank you."
    * I verify the attempt is marked as "DENIED"

  Scenario: Successfully prompt for all required fields for license and short ssn
    * I select the teacher state "Alabama"
    * I click on the Begin link
    * I submit the empty Teacher form using "Teacher Lookup Alabama"
    * I should see error messages on required fields for "Teacher Lookup Alabama"

  Scenario: Successfully prompt for all required fields for no license and no ssn form
    * I select the teacher state "Delaware"
    * I click on the Begin link
    * I submit the empty Teacher form using "Teacher Lookup Delaware"
    * I should see error messages on required fields for "Teacher Lookup Delaware"

  Scenario: Successfully prompt for all required fields for license and no ssn form
    * I select the teacher state "Michigan"
    * I click on the Begin link
    * I submit the empty Teacher form using "Teacher Lookup Michigan"
    * I should see error messages on required fields for "Teacher Lookup Michigan"

  Scenario: Successfully prompt for all required fields for no license and short ssn form
    * I select the teacher state "New Mexico"
    * I click on the Begin link
    * I submit the empty Teacher form using "Teacher Lookup New Mexico"
    * I should see error messages on required fields for "Teacher Lookup New Mexico"
