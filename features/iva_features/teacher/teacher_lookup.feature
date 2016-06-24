@regression @iva @teacher @desktop
Feature: Teacher verification using state lookup

  Background:
    * I visit IDP through the "teacher" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I should be on the teacher verification screen

  @smoke
  #unique combo of ssn/dob
  Scenario: Successful verification with no license and no ssn
    * I verify using teacher credentials with "no license and no ssn"
    * I "approve" the teacher verification in IDme admin
    * I complete the verification process
    * I should be successfully verified

  Scenario: Successful verification with no license and short ssn
    * I verify using teacher credentials with "no license and short ssn"
    * I "approve" the teacher verification in IDme admin
    * I complete the verification process
    * I should be successfully verified

  Scenario: Successful verification with license and no ssn
    * I verify using teacher credentials with "license and no ssn"
    * I "approve" the teacher verification in IDme admin
    * I complete the verification process
    * I should be successfully verified

  Scenario: Successful verification with license and short ssn
    * I verify using teacher credentials with "license and short ssn"
    * I "approve" the teacher verification in IDme admin
    * I complete the verification process
    * I should be successfully verified

  Scenario: Denied attempt for teacher lookup verification
    * I submit the teacher lookup verification form as a "denied" record
    * I "deny" the teacher verification in IDme admin
    * I should see the red alert box error message "We’re sorry, but we were unable to confirm your status as a teacher using the information you provided. Please double-check your information for errors and try again. Also note that only licensed, classroom teachers are eligible. For additional help, please visit our Support page. Thank you."
    * I verify the attempt is marked as "DENIED"

  Scenario: Successfully prompt for all required fields for license and short ssn
    * I submit the empty Teacher form using "Teacher Lookup Alabama"
    * I should see error messages on required fields for "Teacher Lookup Alabama"

  Scenario: Successfully prompt for all required fields for no license and no ssn form
    * I submit the empty Teacher form using "Teacher Lookup Delaware"
    * I should see error messages on required fields for "Teacher Lookup Delaware"

  Scenario: Successfully prompt for all required fields for license and no ssn form
    * I submit the empty Teacher form using "Teacher Lookup Michigan"
    * I should see error messages on required fields for "Teacher Lookup Michigan"

  Scenario: Successfully prompt for all required fields for no license and short ssn form
    * I submit the empty Teacher form using "Teacher Lookup New Mexico"
    * I should see error messages on required fields for "Teacher Lookup New Mexico"
