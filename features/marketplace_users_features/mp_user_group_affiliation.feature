@regression @marketplace @mp_user_group_affiliations @desktop
Feature: Test User Group Affiliation Page & Verification Features 
  
  Background:
		* I visit "MarketplaceLandingPage"
		* I click on the Marketplace Sign Up link
    * I sign up as a new user
    * I visit group affiliations from the shop homepage 

  Scenario: Check Group Affiliations page and tabs
    * I expect to be at the group affiliations page
    * I expect to see the verify group affiliations dashboard
    * I expect that all groups are marked as Instant VIP

  Scenario: Verify a Military Group Affiliation
  	* I select to verify the Military Group Affiliation 
  	* I should be on the military verification screen 
  	* I verify using military email information for "Service Member"
    * I submit the verification code for "Military Email Code"
    * I complete the verification process
    * I verify user "Military" Group Affiliation is approved on Marketplace

  Scenario: Verify a Government Group Affiliation
    * I select to verify the Government Group Affiliation
    * I should be on the government verification screen
    * I submit the government verification form as a "unique" record
    * I submit the verification code for "Government Email"
    * I complete the verification process
    * I verify user "Government Employees" Group Affiliation is approved on Marketplace