@regression @iva @military @scra
Feature: Military verification using SCRA credentials

  Background:
    * I visit the OAuth Tester
    * I select the "Marketplace Military" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I should be on the military verification screen

  @smoke @delete_scra_user1
  #Unique dob and ssn pair
  Scenario: Successful verification as Service Member
    * I verify using SCRA for "Service Member"
    * I complete the verification process
    * I should be successfully verified as "Service Member"

  @delete_scra_user2
  Scenario: Successful verification as Veteran
    * I verify using SCRA for "Veteran"
    * I complete the verification process
    * I should be successfully verified as "Veteran"

  @delete_scra_user3
  Scenario: Successful verification as Military Spouse
    * I verify using SCRA for "Military Spouse"
    * I complete the verification process
    * I should be successfully verified as "Military Spouse"

  # Scenario: Successful verification as Military Spouse
  #   * I verify using SCRA "Military Spouse" information
  #   * I should see the verification success page
  #   * I complete the verification process
  #   * I should be successfully verified as "Military Spouse"

  # Scenario: Successful verification as Military Family
  #   * I verify using SCRA "Military Family" information
  #   * I should see the verification success page
  #   * I complete the verification process
  #   * I should be successfully verified as "Military Family"
  
  # @ignore
  # Scenario: Successful verification as Military Supporter
  #   * I verify using SCRA "Military Supporter" information
  #   * I should see the verification success page
  #   * I complete the verification process
  #   * I should be successfully verified as "Service Member"  

  # Scenario: Successfully prompt for all required fields for Service Member
  #   * I submit the empty SCRA form as "Service Member"
  #   * I should see error messages on required fields for "SCRA"
  
  # Scenario: Successfully prompt for all required fields for Veteran
  #   * I submit the empty SCRA form as "Veteran"
  #   * I should see error messages on required fields for "SCRA"

  # Scenario: Successfully prompt for all required fields for Retiree
  #   * I submit the empty SCRA form as "Retiree"
  #   * I should see error messages on required fields for "SCRA"

  # Scenario: Successfully prompt for all required fields for Military Spouse
  #   * I submit the empty SCRA form as "Military Spouse"
  #   * I should see error messages on required fields for "SCRA"
    
  # Scenario: Successfully prompt for all required fields for Military Family
  #   * I submit the empty SCRA form as "Military Family"
  #   * I should see error messages on required fields for "SCRA"
  
  # Scenario: Successfully prompt for all required fields for Military Supporter
  #   * I submit the empty SCRA form as "Military Supporter"
  #   * I should see error messages on required fields for "SCRA"