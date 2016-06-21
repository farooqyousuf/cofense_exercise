@regression @marketplace @mp_user_group_affiliations @desktop
Feature: Test User Group Affiliation Page & Verification Features 
  
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
    * I verify user "Military" Group Affiliation is approved on Marketplace

