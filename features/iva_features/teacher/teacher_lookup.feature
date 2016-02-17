@regression @iva @teacher @oauth_tester_logout
Feature: Teacher verification using state lookup

  Background:
    * I visit the OAuth Tester
    * I select the "Marketplace Teacher" policy
    * I click on the Sign Up link
    * I sign up as a new user    
    * I should be on the teacher verification screen

  @smoke
  #unique combo of name/dob
  Scenario: Successful verification with no license and no ssn
    * I verify using teacher credentials with "no license and no ssn"
    * I approve the teacher verification in IDme admin
    * I complete the verification process
    * I should be successfully verified

  Scenario: Successful verification with no license and short ssn
    * I verify using teacher credentials with "no license and short ssn"
    * I approve the teacher verification in IDme admin
    * I complete the verification process
    * I should be successfully verified

  Scenario: Successful verification with license and no ssn
    * I verify using teacher credentials with "license and no ssn"
    * I approve the teacher verification in IDme admin
    * I complete the verification process
    * I should be successfully verified

  Scenario: Successful verification with license and short ssn
    * I verify using teacher credentials with "license and short ssn"
    * I approve the teacher verification in IDme admin
    * I complete the verification process
    * I should be successfully verified
