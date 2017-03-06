
@regression @iva @military @scra @desktop
Feature: Military verification using SCRA credentials

  Background:
    * I visit IDP through the "military" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I should be on the military verification screen

  @delete_scra_user1 @smoke
  #Unique dob and ssn pair
  Scenario: Successful verification as Service Member
    * I verify using SCRA for "Service Member"
    * I should be successfully verified as "Service Member"

  @delete_scra_user2
  Scenario: Successful verification as Veteran
    * I verify using SCRA for "Veteran"
    * I should be successfully verified as "Veteran"

  @delete_scra_user3
  Scenario: Successful verification as Military Spouse
    * I verify using SCRA for "Military Spouse"
    * I should be successfully verified as "Military Spouse"

  @delete_scra_user4
  Scenario: Successful verification as Military Family
    * I verify using SCRA for "Military Family"
    * I should be successfully verified as "Military Family"

  @delete_scra_user2
  Scenario: Successful verification as Retiree
    * I verify using SCRA for "Retiree"
    * I should be successfully verified as "Retiree"

  @delete_scra_multi_family_users @wip
  Scenario: Disallow second spouse and fourth family member to verify
    * I verify using SCRA for "Service Member"
    * I clear the session from Authority
    * Multi-spouse: I verify "first" spouse via "scra"
    * Multi-family: I verify "first" family via "scra"
    * Multi-family: I verify "second" family via "scra"
    * Multi-family: I verify "third" family via "scra"
    * Multi-spouse: I verify "second" spouse via "scra" is not allowed to verify
    * Multi-family: I verify "fourth" family via "scra" is not allowed to verify

  @delete_scra_denied_user
  Scenario: Denied attempt for military scra verification
    * I submit the military scra verification form as a "denied" record
    * I should see the red alert box error message "We're sorry, but we were unable to verify your military status with the information you provided. Please utilize the name you held when discharged, and be sure to use an active duty date from the middle of your period of service. Note that Reservists, National Guardsmen, and all pre-1985 Veterans, must verify by uploading documentation. For additional information, please see our Support page."
    * I verify the attempt is marked as "DENIED"

 @delete_scra_dupe_user @wip
 Scenario: Dupe attempt test for Military SCRA
    * I verify using SCRA for "Service Member"
    * I clear the session from Authority
    * I create a new account after clearing my old "military" session
    * I verify using a duplicate "SCRA" record
    * I should see the red alert box error message "We're sorry, but we were unable to verify your military status with the information you provided. Please utilize the name you held when discharged, and be sure to use an active duty date from the middle of your period of service. Note that Reservists, National Guardsmen, and all pre-1985 Veterans, must verify by uploading documentation. For additional information, please see our Support page."
    * I verify the attempt is marked as "DUPLICATE"

  Scenario: Successfully prompt for all required fields for Service Member
    * I submit the empty SCRA form for "Service Member"
    * I should see error messages on required fields for "SCRA"

  Scenario: Successfully prompt for all required fields for Veteran
    * I submit the empty SCRA form for "Veteran"
    * I should see error messages on required fields for "SCRA"

  Scenario: Successfully prompt for all required fields for Retiree
    * I submit the empty SCRA form for "Retiree"
    * I should see error messages on required fields for "SCRA"

  Scenario: Successfully prompt for all required fields for Military Spouse
    * I submit the empty SCRA form for "Military Spouse"
    * I should see error messages on required fields for "SCRA Family"

  Scenario: Successfully prompt for all required fields for Military Family
    * I submit the empty SCRA form for "Military Spouse"
    * I should see error messages on required fields for "SCRA Family"

# commented out supporter as this option is not being used in production currently
  # Scenario: Successfully prompt for all required fields for Military Supporter
  #   * I submit the empty SCRA form for "Military Supporter"
  #   * I should see error messages on required fields for "SCRA"

# commented out supporter as this option is not being used in production currently
  # @delete_scra_user5
  # Scenario: Successful verification as Military Supporter
  #   * I verify using SCRA for "Military Supporter"
  #   * I should be successfully verified as "Retiree"
