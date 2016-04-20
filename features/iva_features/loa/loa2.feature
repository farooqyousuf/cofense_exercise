@regression @iva @loa
Feature: Test the LOA2 (Level of Assurance 2) functionality

  Background:
    * I visit IDP through the "ficam_loa_2" policy

  @delete_experian_user2
  Scenario: Successful LOA2 verification
    * I click on the Sign Up link
    * I sign up as a new user
    * I confirm my email address
    * I submit information for "LOA2"
    * I answer the KBA questions
    * I confirm my phone
    * I authorize the attribute release
    * I should be successfully verified
    * I should be successfully authenticated using "LOA2"

  Scenario: LOA2 login flow using a LOA1 verified user
    * I login as a "LOA1" user
    * I should see the information collection screen for LOA2

  @smoke
  Scenario: LOA2 login flow using a LOA2 verified user
    * I login as a "LOA2" user
    * I confirm my phone
    * I authorize the attribute release
    * I should be successfully verified

  Scenario: LOA2 login flow using a LOA3 verified user
    * I login as a "LOA3" user
    * I confirm my phone
    * I authorize the attribute release
    * I should be successfully verified
