@regression @hlp @hlp_admin @hlp_wufoo_page
Feature: Test the HLP Wufoo page functionality

  Background:
    * I visit "HlpPartnerIndexPage"
    * I login with Authority
    * I check if page name has been already taken for the "WufooPage"
    * I visit the Add Wufoo page

  Scenario: Add a new Wufoo Page
    * I create a new Wufoo Page
    * I should see Wufoo edit page elements
    * I delete the Wufoo hlp page

  Scenario: Cancel a created Wufoo page
    * I create a new Wufoo Page
    * I cancel the Wufoo Page
    * I should be on the HLP_Test_Partner_Pages page
    * I delete the original Wufoo Page
 
  Scenario: Cancel a uncreated Wufoo page
    * I fill out the data for a Wufoo page 
    * I cancel the Wufoo page

  @check
  Scenario: Duplicate an WufooPage
    * I create a new Wufoo Page 
    * I duplicate a Wufoo Page
    * The Wufoo Page name should have copy appended at the end
    * I delete the Wufoo Page copy
    * I delete the original Wufoo Page
 
  
  Scenario: Preview an WufooPAGe
    * I create a new Wufoo Page
    * I preview the Wufoo Page
    * I verify all the elements on the WufooPage 
    * I delete the Wufoo hlp page


  Scenario: Launch a WufooPage
    * I create a new Wufoo Page 
    * I launch the Wufoo Page
    * I live the Wufoo page
    * I verify all the elements on the live Wufoo hlp page
    * I verify the Wufoo page offer button redirects the user to IDP-IVA
    * I delete the Wufoo hlp page
