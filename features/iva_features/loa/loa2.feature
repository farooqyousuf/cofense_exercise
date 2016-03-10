@regression @iva @loa @oauth_tester_logout
Feature: Test the LOA1 (Level of Assurance 2) functionality

  Background:
    * I visit the OAuth Tester
    * I select the "FICAM LOA2" policy
    * I click on the Sign Up link
    * I sign up as a new user

    @delete_experian_user
    Scenario: Successful LOA2 verification
     * I confirm my email address
     * I submit information for "LOA2"
     * I answer the KBA questions
     * I confirm my phone
     * I authorize the attribute release
     * I should be successfully verified as "LOA2"