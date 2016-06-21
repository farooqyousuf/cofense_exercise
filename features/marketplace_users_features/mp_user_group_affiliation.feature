@regression @marketplace @mp_user_verify @desktop
Feature: Test User Group Affiliation Verification through Marketplace 
  
  Background:
		* I visit "MarketplaceLandingPage"
		* I click on the Marketplace Sign Up link
    * I sign up as a new user
    * I visit "MarketplaceGroupAffiliationsPage"


  Scenario: Verify a Military Group Affiliation
  	* I select to verify the Military Group Affiliation 
  	* I should be on the military verification screen 
  	* I verify using military email information for "Service Member"
    * I submit the verification code for "Military Email Code"
    * I complete the verification process
    * I should be successfully verified as "Service Member"
    // TODO: check return to verify marketplace ui 
    // TODO: hook to delete the test user afterwards. 
