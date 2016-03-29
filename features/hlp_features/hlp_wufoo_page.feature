@regression @hlp @hlp_admin @hlp_wufoo_page
Feature: Test the HLP Wufoo page functionality

  Background:
    * I visit "HlpPartnerIndexPage"
    * I login with Authority
    * I check if page name has been already taken for the "WufooPage"
    * I visit the Add Wufoo page


  Scenario: Add a new Wufoo Page
    * I create a new Wufoo Page
    * I should see the edit hlp page tab elements
    * I delete the selected hlp page

  Scenario: Cancel a created Wufoo page
    * I create a new Wufoo Page
    * I cancel the selected hlp page
    * I should be on the HLP_Test_Partner_Pages page
    * I delete the original Wufoo Page

  Scenario: Cancel a uncreated Wufoo page
    * I fill out the data for a Wufoo page
    * I cancel the selected hlp page

  @check
  Scenario: Duplicate an WufooPage
    * I create a new Wufoo Page
    * I duplicate the selected HLP Page
    * The Wufoo Page name should have copy appended at the end
    * I delete the HLP page duplicate
    * I delete the original Wufoo Page


  Scenario: Preview an WufooPAGe
    * I create a new Wufoo Page
    * I preview the selected HLP page
    * I verify all the elements on the WufooPage
    * I delete the selected hlp page

@refactor
  Scenario: Launch a WufooPage
    * I create a new Wufoo Page
    * I launch the HLP page
    * I click to see the live HLP page
    * I verify all the elements on the live Wufoo hlp page
    * I verify the HLP page offer button redirects the user to IDP-IVA
    * I delete the selected hlp page
