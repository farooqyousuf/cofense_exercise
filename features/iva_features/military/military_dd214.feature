@regression @iva @military @dd214 @document @desktop
Feature: Military verification using DD214 request

  Background:
    * I visit IDP through the "military" policy
    * I create a Military DD214 page object
    * I click on the Sign Up link
    * I sign up as a new user
    * I click on the Verify by requesting DD214 link
    * I click on the Begin link

  @smoke @delete_dd214_user
  #unique dob/ssn to pass verification
  Scenario: Successful DD214 verification as a Veteran via document
    * I verify using DD214 information for "Veteran" via "document"
    * I should be successfully verified as "Veteran"
    * I verify user level properties for "DD214 Vet via document"

  @delete_scra_user2
  Scenario: Successful DD214 verification as a Veteran via SCRA
    * I verify using DD214 information for "Veteran" via "SCRA"
    * I should be successfully verified as "Veteran"
    * I verify user level properties for "DD214 Vet via SCRA"

  @delete_dd214_user2
  Scenario: Successful DD214 verification as a Next of Kin Deceased Veteran
    * I verify using DD214 information for "Next of kin deceased veteran" via "document"
    * I should be successfully verified as "Military Family"
    * I verify user level properties for "DD214 Next of Kin Deceased Vet"

  @delete_dd214_user2
  Scenario: Successful DD214 verification as a Legal Guardian
    * I verify using DD214 information for "Legal guardian" via "document"
    * I should be successfully verified as "Military Family"
    * I verify user level properties for "DD214 Legal Guardian"

  @wip @delete_dd214_user
  Scenario: Denied attempt for DD214 verification
    * I submit the DD214 verification form as a "denied" record
    * I "deny" the DD214 in IDme admin
    * I verify the attempt is marked as "DENIED"

 @delete_dd214_dupe_user
 Scenario: Dupe attempt test for Military DD214 (Error code 75)
    * I verify using DD214 information for "Veteran" via "document"
    * I clear the session from Authority
    * I create a new account after clearing my old "military" session
    * I click on the Verify by requesting DD214 link
    * I click on the Begin link
    * I verify using duplicate DD214 information for "Veteran" via "document"
    * I should see the error message "We’re sorry, but we are unable to verify your military status with the information you provided."
    * I verify the attempt is marked as "DUPLICATE"

 Scenario: Successfully prompt for all DD214 required fields for Veteran
    * I submit the empty DD214 form for "Veteran"
    * I should see error messages on required fields for "DD214 Vet"

 Scenario: Successfully prompt for all DD214 required fields for Next of Kin Deceased Veteran
    * I submit the empty DD214 form for "Next of kin deceased veteran"
    * I should see error messages on required fields for "DD214 Non-Vet"

Scenario: Successfully prompt for all DD214 required fields for Legal Guardian
    * I submit the empty DD214 form for "Legal guardian"
    * I should see error messages on required fields for "DD214 Non-Vet"
