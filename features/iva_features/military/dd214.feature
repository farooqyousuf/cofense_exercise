@regression @iva @military @dd214 @document
Feature: Military verification using DD214 request

  Background:
    * I visit the OAuth Tester
    * I select the "Marketplace Military" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I should be on the military verification screen

  @smoke @delete_user @oauth_tester_logout
  #unique dob/ssn to pass verification
  Scenario: Successful verification as a Veteran
    * I verify using DD214 information for "Veteran"
    * I complete the verification process
    * I should be successfully verified as "Veteran"
  
  @delete_user @oauth_tester_logout
  Scenario: Successful verification as a Next of Kin Deceased Veteran
    * I verify using DD214 information for "Next of kin deceased veteran"
    * I complete the verification process
    * I should be successfully verified as "Military Family"

  @delete_user @oauth_tester_logout
  Scenario: Successful verification as a Legal Guardian
    * I verify using DD214 information for "Legal guardian"
    * I complete the verification process
    * I should be successfully verified as "Military Family"

 @oauth_tester_logout
 Scenario: Successfully prompt for all required fields for Veteran
    * I submit the empty DD214 form for "Veteran"
    * I should see error messages on required fields for "DD214 Vet"

 @oauth_tester_logout
 Scenario: Successfully prompt for all required fields for Next of Kin Deceased Veteran
    * I submit the empty DD214 form for "Next of kin deceased veteran"
    * I should see error messages on required fields for "DD214 Non-Vet"    

@oauth_tester_logout
Scenario: Successfully prompt for all required fields for Legal Guardian
    * I submit the empty DD214 form for "Legal guardian"
    * I should see error messages on required fields for "DD214 Non-Vet"    