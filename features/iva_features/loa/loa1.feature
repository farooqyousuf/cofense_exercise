@regression @iva @loa @oauth_tester_logout
Feature: Test the LOA1 (Level of Assurance 1) functionality

  Background:
    * I visit the OAuth Tester
    * I select the "FICAM LOA1" policy
    * I click on the Sign Up link
    * I sign up as a new user

    
    Scenario: Successful LOA1 verification
     # * I should see the email confirmation page
     * I confirm my email address
     # * I should see the Authorize screen
     * I authorize the attribute release
     * I should be successfully verified as "LOA1"
     # * I logout of the SP LOA app