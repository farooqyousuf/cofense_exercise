@regression @iva @loa @desktop
Feature: Test the LOA1 (Level of Assurance 1) functionality

  Background:
    * I visit IDP through the "ficam_loa_1" policy
    * I click on the Sign Up link
    * I sign up as a new user

  Scenario: Successful LOA1 verification
    * I confirm my email address
    * I authorize the attribute release
    * I should be successfully verified as "LOA1"
