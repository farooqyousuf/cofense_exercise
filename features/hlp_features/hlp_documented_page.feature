@regression @hlp @hlp_admin @hlp_document_page

Feature: Test the HLP DocumentPage functionality

Background:
  * I visit "HlpPartnerIndexPage"
  * I login with Authority
  * I check if page name has been already taken for the "DocumentPage"
  * I visit the Add DocumentPage page

  Scenario: Add a new DocumentPage page
    * I create a new DocumentPage
    * I should see DocumentPage edit page elements
    * I delete the DocumentPage hlp page

  Scenario: Cancel a created DocumentPage
    * I create a new DocumentPage
    * I cancel the DocumentPage
    * I should be on the HLP_Test_Partner_Pages page
    * I delete the original temp_hlp_document_page

  Scenario: Cancel a created DocumentPage
    * I fill out the required data for the DocumentPage
    * I cancel the DocumentPage
    * I should be on the HLP_Test_Partner_Pages page

  Scenario: Duplicate a DocumentPage
    * I create a new DocumentPage
    * I duplicate the DocumentPage
    * The DocumentPage name should have copy appended at the end
    * I delete the DocumentPage Duplicate
    * I delete the original temp_hlp_document_page

  Scenario: Preview an DocumentPage
    * I create a new DocumentPage
    * I preview the DocumentPage
    * I verify all the elements on the Preview DocumentPage hosted landing page
    * I delete the DocumentPage hlp page

  Scenario: Launch an DocumentPage
    * I create a new DocumentPage
    * I launch the DocumentPage
    * I live page the DocumentPage
    * I verify all the elements on the Live DocumentPage hosted landing page
    * I verify the DocumentPage offer button redirects the user to IDP-IVA
    * I delete the DocumentPage hlp page
