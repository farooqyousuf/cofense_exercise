@regression @iva @military
Feature: Military verification using document upload

  Background:
    * I visit the OAuth Tester
    * I select the "Marketplace Military" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I should be on the military verification screen

  @smoke @oauth_tester_logout @delete_experian_user
  Scenario: Successful verification as a Service Member
    * I verify using military documentation for "Service Member"
    * I approve the document in IDme admin
    * I complete the verification process
    * I should be successfully verified as "Service Member"

  @oauth_tester_logout @delete_experian_user
  Scenario: Successful verification as a Veteran
    * I verify using military documentation for "Veteran"
    * I approve the document in IDme admin
    * I complete the verification process
    * I should be successfully verified as "Veteran"

  @oauth_tester_logout @delete_experian_user
  Scenario: Successful verification as a Retiree
    * I verify using military documentation for "Retiree"
    * I approve the document in IDme admin
    * I complete the verification process
    * I should be successfully verified as "Retiree"

@oauth_tester_logout @delete_experian_user
  Scenario: Successful verification as a Military Spouse
    * I verify using military documentation for "Military Spouse"
    * I approve the document in IDme admin
    * I complete the verification process
    * I should be successfully verified as "Military Spouse"

@oauth_tester_logout @delete_experian_user
  Scenario: Successful verification as a Military Family
    * I verify using military documentation for "Military Family"
    * I approve the document in IDme admin
    * I complete the verification process
    * I should be successfully verified as "Military Family"

 @oauth_tester_logout @delete_experian_user
  Scenario: Successful verification as a Military Supporter
    * I verify using military documentation for "Military Supporter"
    * I approve the document in IDme admin
    * I complete the verification process
    * I should be successfully verified as "Military Supporter"   