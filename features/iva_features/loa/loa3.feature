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

  Scenario: LOA3 login flow using a LOA1 verified user
    * I login as a "LOA1" user
    * I should see the information collection screen for LOA3 

  Scenario: LOA3 login flow using a LOA2 verified user
    * I login as a "LOA2" user
    * I should see the information collection screen for LOA3

  @smoke
  Scenario: LOA3 login flow using a LOA3 verified user
    * I login as a "LOA3" user
    * I confirm my phone
    * I authorize the attribute release
    * I should be successfully verified as "LOA3"