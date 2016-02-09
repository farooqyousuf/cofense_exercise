@regression @iva @teacher @oauth_tester_logout
Feature: Teacher verification using document upload

  Background:
    * I visit the OAuth Tester
    * I select the "Marketplace Teacher" policy
    * I click on the Sign Up link
    * I sign up as a new user    
    * I should be on the teacher verification screen

  @smoke
  #experian/precise id check
  Scenario: Successful verification
    * I verify using teacher documentation
    * I approve the document in IDme admin
    * I complete the verification process
    * I should be successfully verified