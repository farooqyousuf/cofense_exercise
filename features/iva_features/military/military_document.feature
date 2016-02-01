@regression @iva @military @oauth_tester_logout
Feature: Military verification using document upload

  Background:
    * I visit the OAuth Tester
    * I select the "Marketplace Military" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I should be on the military verification screen

  @smoke @delete_experian_user
  #unique doc upload and user creds have to pass experian/preciseID
  Scenario: Successful verification as a Service Member
    * I verify using military documentation for "Service Member"
    * I approve the document in IDme admin
    * I complete the verification process
    * I should be successfully verified as "Service Member"

  @delete_experian_user
  Scenario: Successful verification as a Veteran
    * I verify using military documentation for "Veteran"
    * I approve the document in IDme admin
    * I complete the verification process
    * I should be successfully verified as "Veteran"

  @delete_experian_user
  Scenario: Successful verification as a Retiree
    * I verify using military documentation for "Retiree"
    * I approve the document in IDme admin
    * I complete the verification process
    * I should be successfully verified as "Retiree"

  @delete_experian_user
  Scenario: Successful verification as a Military Spouse
    * I verify using military documentation for "Military Spouse"
    * I approve the document in IDme admin
    * I complete the verification process
    * I should be successfully verified as "Military Spouse"

  @delete_experian_user
  Scenario: Successful verification as a Military Family
    * I verify using military documentation for "Military Family"
    * I approve the document in IDme admin
    * I complete the verification process
    * I should be successfully verified as "Military Family"

  @delete_experian_user
  Scenario: Successful verification as a Military Supporter
    * I verify using military documentation for "Military Supporter"
    * I approve the document in IDme admin
    * I complete the verification process
    * I should be successfully verified as "Military Supporter"   

 Scenario: Successfully prompt for all required fields for Service Member
    * I submit the empty military document form for "Service Member"
    * I should see error messages on required fields for "Military Document"

 Scenario: Successfully prompt for all required fields for Veteran
    * I submit the empty military document form for "Veteran"
    * I should see error messages on required fields for "Military Document"   

Scenario: Successfully prompt for all required fields for Retiree
    * I submit the empty military document form for "Retiree"
    * I should see error messages on required fields for "Military Document"    

Scenario: Successfully prompt for all required fields for Military Spouse
    * I submit the empty military document form for "Military Spouse"
    * I should see error messages on required fields for "Military Document Family"    

Scenario: Successfully prompt for all required fields for Military Family
    * I submit the empty military document form for "Military Family"
    * I should see error messages on required fields for "Military Document Family"    

Scenario: Successfully prompt for all required fields for Military Supporter
    * I submit the empty military document form for "Military Supporter"
    * I should see error messages on required fields for "Military Document"    
