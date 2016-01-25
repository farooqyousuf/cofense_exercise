@regression @iva @military @email @oauth_tester_logout  
Feature: Military verification using .mil email

  Background:
    * I visit the OAuth Tester
    * I select the "Marketplace Military" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I should be on the military verification screen

  @smoke @delete_user
  Scenario: Successful verification with a military email as Service Member
    * I verify using military email information for "Service Member"
    * I submit the verification code for "Military Email Code"
    * I complete the verification process
    * I should be successfully verified as "Service Member"  

  @delete_user  
  Scenario: Successful verification with a military email as Military Spouse
    * I verify using military email information for "Military Spouse"
    * I submit the verification code for "Military Email Code"
    * I complete the verification process
    * I should be successfully verified as "Military Spouse"

  @delete_user
  Scenario: Successful verification as Military Family
    * I verify using military email information for "Military Family"
    * I submit the verification code for "Military Email Code"
    * I complete the verification process
    * I should be successfully verified as "Military Family"
    
  @delete_user  
  Scenario: Successful verification as Military Supporter
    * I verify using military email information for "Military Supporter"
    * I submit the verification code for "Military Email Code"
    * I complete the verification process
    * I should be successfully verified as "Military Supporter"

  Scenario: Successfully prompt for all required fields for Service Member
    * I submit the empty military email form for "Service Member"
    * I should see error messages on required fields for "Military Email"    
      
  Scenario: Successfully prompt for all required fields for Military Spouse
    * I submit the empty military email form for "Military Spouse"
    * I should see error messages on required fields for "Military Email Family"

  Scenario: Successfully prompt for all required fields for Military Family
    * I submit the empty military email form for "Military Family"
    * I should see error messages on required fields for "Military Email Family"

  Scenario: Successfully prompt for all required fields for Military Supporter
    * I submit the empty military email form for "Military Supporter"
    * I should see error messages on required fields for "Military Email"