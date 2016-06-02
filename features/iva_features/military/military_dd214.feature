@regression @iva @military @dd214 @document @desktop
Feature: Military verification using DD214 request

  Background:
    * I visit IDP through the "military" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I should be on the military verification screen

  @smoke @delete_dd214_user
  #unique dob/ssn to pass verification
  Scenario: Successful verification as a Veteran
    * I verify using DD214 information for "Veteran"
    * I complete the verification process
    * I should be successfully verified as "Veteran"
    * I pry

  @delete_dd214_user2
  Scenario: Successful verification as a Next of Kin Deceased Veteran
    * I verify using DD214 information for "Next of kin deceased veteran"
    * I complete the verification process
    * I should be successfully verified as "Military Family"

  @delete_dd214_user2
  Scenario: Successful verification as a Legal Guardian
    * I verify using DD214 information for "Legal guardian"
    * I complete the verification process
    * I should be successfully verified as "Military Family"

  # Scenario: Dupe check/unsuccessful attempt for DD214 verification
  #   * I submit the DD214 verification form as a dupe record
  #   * I should see the red alert box error message "We’re sorry, but we are unable to verify your credentials with the information you provided."
  #   * I verify the attempt is marked as "DUPLICATE"

 Scenario: Successfully prompt for all required fields for Veteran
    * I submit the empty DD214 form for "Veteran"
    * I should see error messages on required fields for "DD214 Vet"

 Scenario: Successfully prompt for all required fields for Next of Kin Deceased Veteran
    * I submit the empty DD214 form for "Next of kin deceased veteran"
    * I should see error messages on required fields for "DD214 Non-Vet"

Scenario: Successfully prompt for all required fields for Legal Guardian
    * I submit the empty DD214 form for "Legal guardian"
    * I should see error messages on required fields for "DD214 Non-Vet"
