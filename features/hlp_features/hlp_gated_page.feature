@regression @hlp @hlp_admin @hlp_gated_page
Feature: Test the HLP GatedPage functionality

  Background:
    * I visit "HlpPartnerIndexPage"
    * I login with Authority
    * I check if page name has been already taken for the "GatedPage"
    * I visit the Add GatedPage page
  @refactor  
  Scenario: Add a new GatedPage page
    * I create a new GatedPage
    * I should see the edit hlp page tab elements
    * I delete the GatedPage hlp page

  Scenario: Cancel a created GatedPage
    * I create a new GatedPage
    * I cancel the GatedPage
    * I should be on the HLP_Test_Partner_Pages page
    * I delete the original temp_hlp_gated

  Scenario: Cancel an uncreated GatedPage
    * I fill out the data for the GatedPage
    * I cancel the GatedPage

  Scenario: Delete an GatedPage
    * I create a new GatedPage
    * I delete the GatedPage hlp page
    * I verify the deleted GatedPage is deleted

  Scenario: Duplicate an GatedPage
    * I create a new GatedPage
    * I duplicate the GatedPage
    * The GatedPage name should have copy appended at the end
    * I delete the GatedPage copy
    * I delete the original temp_hlp_gated

  Scenario: Preview an GatedPage
    * I create a new GatedPage
    * I preview the GatedPage
    * I verify all the elements on the Preview GatedPage hosted landing page
    * I delete the GatedPage hlp page

  Scenario: Launch an GatedPage
    * I create a new GatedPage
    * I launch the GatedPage
    * I live page the GatedPage
    * I verify all the elements on the Live GatedPage hosted landing page
    * I verify the GatedPage offer button redirects the user to IDP-IVA
    * I delete the GatedPage hlp page
