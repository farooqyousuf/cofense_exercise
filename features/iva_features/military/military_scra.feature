
@regression @iva @military @scra @desktop
Feature: Military verification using SCRA credentials

  Background:
    * I set the External Vendor Environment to "SCRA Production"
    * I visit IDP through the "military" policy
    * I create a Military SCRA page object
    * I click on the Sign Up link
    * I sign up as a new user
    * I click on the Verify using a government service record link
    * I click on the Begin link

  @delete_current_user_email @smoke
  #Unique dob and ssn pair
  Scenario: Successful verification as Service Member
    * I verify using SCRA for "Service Member"
    * I should be successfully verified as "Service Member"
    * I verify user level properties for "SCRA Service Member"

  @delete_current_user_email
  Scenario: Successful verification as Veteran
    * I verify using SCRA for "Veteran"
    * I should be successfully verified as "Veteran"
    * I verify user level properties for "SCRA Veteran"

  @delete_current_user_email
  Scenario: Successful verification as Military Spouse
    * I verify using SCRA for "Military Spouse"
    * I should be successfully verified as "Military Spouse"
    * I verify user level properties for "SCRA Mil Spouse"

  @delete_current_user_email
  Scenario: Successful verification as Military Family
    * I verify using SCRA for "Military Family"
    * I should be successfully verified as "Military Family"
    * I verify user level properties for "SCRA Mil Family"

  @delete_current_user_email
  Scenario: Successful verification as Retiree
    * I verify using SCRA for "Retiree"
    * I should be successfully verified as "Retiree"
    * I verify user level properties for "SCRA Retiree"

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

  @delete_current_user_email @wip
  Scenario: Denied attempt for military scra verification (Error code 1)
    * I submit the military scra verification form as a "denied" record
    * I should see the error message "We're sorry, but we were unable to verify your military status with the information you provided. Please utilize the name you held when discharged, and be sure to use an active duty date from the middle of your period of service. Note that Reservists, National Guardsmen, and all pre-1985 Veterans, must verify by uploading documentation. For additional information, please see our Support page."
    * I verify the attempt is marked as "DENIED"

 @delete_scra_dupe_user @wip
 Scenario: Dupe attempt test for Military SCRA (Error code 73)
    * I verify using SCRA for "Service Member"
    * I clear the session from Authority
    * I create a new account after clearing my old "military" session
    * I click on the Verify using a government service record link
    * I click on the Begin link
    * I verify using a duplicate "SCRA" record
    * I should see the  error message "We're sorry, but we were unable to verify your military status with the information you provided. Please utilize the name you held when discharged, and be sure to use an active duty date from the middle of your period of service. Note that Reservists, National Guardsmen, and all pre-1985 Veterans, must verify by uploading documentation. For additional information, please see our Support page."
    * I verify the attempt is marked as "DUPLICATE"

  @delete_current_user_email
  Scenario: Successfully prompt for all required fields for Service Member
    * I submit the empty SCRA form for "Service Member"
    * I should see error messages on required fields for "SCRA"

  @delete_current_user_email
  Scenario: Successfully prompt for all required fields for Veteran
    * I submit the empty SCRA form for "Veteran"
    * I should see error messages on required fields for "SCRA"

  @delete_current_user_email
  Scenario: Successfully prompt for all required fields for Retiree
    * I submit the empty SCRA form for "Retiree"
    * I should see error messages on required fields for "SCRA"

  @delete_current_user_email
  Scenario: Successfully prompt for all required fields for Military Spouse
    * I submit the empty SCRA form for "Military Spouse"
    * I should see error messages on required fields for "SCRA Family"

  @delete_current_user_email
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
