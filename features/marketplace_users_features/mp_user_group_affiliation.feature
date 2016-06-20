@regression @marketplace @mp_user_verify @desktop
Feature: Test User Group Affiliation Verification through Marketplace 
  
  Background:
    * I visit "MarketplaceLandingPage"
    * I sign-up with a generic test user account
    * I visit "VerifyGroupAffiliationPage" 

  Scenario: Verify a Military Group Affiliation
    * I visit the "MarketplaceGroupAffiliationsPage"
  	* I select to verify the Military Group Affiliation 
