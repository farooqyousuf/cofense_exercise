@regression @iva @loa @oauth_tester_logout
Feature: Test the LOA3 (Level of Assurance 3) functionality

  Background:
    * I visit the OAuth Tester
    * I select the "FICAM LOA3" policy
    
  @delete_experian_user2
  Scenario: Successful LOA3 verification
    * I click on the Sign Up link
    * I sign up as a new user
    * I confirm my email address
    * I submit information for "LOA3"
    * I answer the KBA questions
    * I confirm my phone
    * I authorize the attribute release
    * I should be successfully verified as "LOA3"