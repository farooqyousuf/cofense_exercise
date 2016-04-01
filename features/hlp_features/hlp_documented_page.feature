@regression @hlp @hlp_admin @hlp_document_page

Feature: Test the HLP DocumentPage functionality

Background:
  * I visit "HlpPartnerIndexPage"
  * I login with Authority
  * I check if page name has been already taken for the "DocumentPage"
  * I visit the Add DocumentPage page

  @smoke
  Scenario: Add a new DocumentPage page
    * I create a new DocumentPage
    * I should see the edit hlp page tab elements
    * I delete the selected hlp page

  Scenario: Cancel a created DocumentPage
    * I create a new DocumentPage
    * I cancel the selected hlp page
    * I should be on the HLP_Test_Partner_Pages page
    * I delete the original temp_hlp_document_page

  Scenario: Cancel a created DocumentPage
    * I fill out the required data for the DocumentPage
    * I cancel the selected hlp page
    * I should be on the HLP_Test_Partner_Pages page

  Scenario: Duplicate a DocumentPage
    * I create a new DocumentPage
    * I duplicate the selected HLP Page
    * The DocumentPage name should have copy appended at the end
    * I delete the HLP page duplicate
    * I delete the original temp_hlp_document_page

  Scenario: Preview an DocumentPage
    * I create a new DocumentPage
    * I preview the selected HLP page
    * I verify all the elements on the Preview DocumentPage hosted landing page
    * I delete the selected hlp page
@refactor
  Scenario: Launch an DocumentPage
    * I create a new DocumentPage
    * I launch the HLP page
    * I click to see the live HLP page
    * I verify all the elements on the Live DocumentPage hosted landing page
    * I verify the HLP page offer button redirects the user to IDP-IVA
    * I delete the selected hlp page
