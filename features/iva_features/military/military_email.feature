@regression @iva @military @email
Feature: Military verification using .mil email

  Background:
    * I visit the OAuth Tester
    * I select the "Marketplace Military" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I should be on the military verification screen

  @smoke @delete_user @oauth_tester_logout
  Scenario: Successful verification with a military email as Service Member
    * I verify using military email information for "Service Member"
    * I submit the verification code for "Military Email Code"
    * I complete the verification process
    * I should be successfully verified as "Service Member"  

  @delete_user @oauth_tester_logout  
  Scenario: Successful verification with a military email as Military Spouse
    * I verify using military email information for "Military Spouse"
    * I submit the verification code for "Military Email Code"
    * I complete the verification process
    * I should be successfully verified as "Military Spouse"

  @delete_user @oauth_tester_logout
  Scenario: Successful verification as Military Family
    * I verify using military email information for "Military Family"
    * I submit the verification code for "Military Email Code"
    * I complete the verification process
    * I should be successfully verified as "Military Family"
    
  @delete_user @oauth_tester_logout  
  Scenario: Successful verification as Military Supporter
    * I verify using military email information for "Military Supporter"
    * I submit the verification code for "Military Email Code"
    * I complete the verification process
    * I should be successfully verified as "Military Supporter"
