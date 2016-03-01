@regression @hlp @hlp_admin
Feature: Test the HLP UngatedPage functionality

  Background:
    * I visit "HlpPartnerIndexPage"
    * I login with Authority
    * I check if page name has been already taken for the "UngatedPage"
    * I visit the Add UngatedPage page

  Scenario: Add a new Ungated page
    * I create a new UngatedPage
    * I should see UngatedPage edit page elements
    * I delete the UngatedPage hlp page

  Scenario: Cancel a created UngatedPage
    * I create a new UngatedPage
    * I cancel the UngatedPage
    * I should be on the HLP_Test_Partner_Pages page
    * I delete the original temp_hlp_ungated

  Scenario: Cancel an uncreated UngatedPage
    * I fill out the data for the UngatedPage
    * I cancel the UngatedPage
  @check
  Scenario: Delete an UngatedPage
    * I create a new UngatedPage
    * I delete the UngatedPage hlp page
    * I verify the deleted UngatedPage is deleted

  Scenario: Duplicate an UngatedPage
    * I create a new UngatedPage
    * I duplicate the UngatedPage
    * The UngatedPage name should have copy appended at the end
    * I delete the UngatedPage copy
    * I delete the original temp_hlp_ungated

  Scenario: Preview an UngatedPage
    * I create a new UngatedPage
    * I preview the UngatedPage
    * I verify all the elements on the Preview UngatedPage hosted landing page
    * I delete the UngatedPage hlp page
