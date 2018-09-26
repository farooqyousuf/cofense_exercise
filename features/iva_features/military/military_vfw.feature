@regression @iva @military
Feature: Military verification with VFW number

  Background:
    * I set the External Vendor Environment to "Staging"
    * I visit IDP through the "vfw" policy
    * I create "MilitaryEmail, MilitaryVFW" page objects
    * I click on the Sign Up link
    * I sign up as a new user
    * I verify a military user
    * I click on the Begin link

  @smoke @delete_current_user_email
  Scenario: Successfully add a valid vfw number to military user
    * I add a "valid" vfw number to user
    * I click on "Continue"
    * I authorize the attribute release
    * I should be successfully verified as "VFW"
