@regression @hlp @hlp_admin @hlp_ungated_page @desktop
Feature: Test the HLP UngatedPage functionality

  Background:
    * I visit "HlpPartnerIndexPage"
    * I login with Authority
    * I check if page name has been already taken for the "UngatedPage"
    * I visit the Add UngatedPage page

  @smoke
  Scenario: Add a new Ungated page
    * I create a new UngatedPage
    * I should see the edit hlp page tab elements
    * I delete the selected hlp page

  Scenario: Cancel a created UngatedPage
    * I create a new UngatedPage
    * I cancel the selected hlp page
    * I should be on the HLP_Test_Partner_Pages page
    * I delete the original temp_hlp_ungated

  Scenario: Cancel an uncreated UngatedPage
    * I fill out the data for the UngatedPage
    * I cancel the selected hlp page

  Scenario: Delete an UngatedPage
    * I create a new UngatedPage
    * I delete the selected hlp page
    * I verify the deleted UngatedPage is deleted

  Scenario: Duplicate an UngatedPage
    * I create a new UngatedPage
    * I duplicate the selected HLP Page
    * The UngatedPage name should have copy appended at the end
    * I delete the HLP page duplicate
    * I delete the original temp_hlp_ungated

  Scenario: Preview an UngatedPage
    * I create a new UngatedPage
    * I preview the selected HLP page
    * I verify all the elements on the Preview UngatedPage hosted landing page
    * I delete the selected hlp page
 @refactor
  Scenario: Launch an UngatedPage
    * I create a new UngatedPage
    * I launch the HLP page
    * I click to see the live HLP page
    * I verify all the elements on the Live UngatedPage hosted landing page
    * I verify the HLP page offer button redirects the user to IDP-IVA
    * I delete the selected hlp page
