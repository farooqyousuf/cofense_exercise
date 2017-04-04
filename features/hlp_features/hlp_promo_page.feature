@regression @hlp @hlp_admin @hlp_promo_page @desktop

Feature: Test the HLP DocumentPage functionality

  Background:
    * I visit "HlpPartnerIndexPage"
    * I login with Authority
    * I check if page name has been already taken for the "PromoCodePage"
    * I visit the Add PromoCodePage

  @smoke
  Scenario: Add a new PromoCodePage
    * I create a new PromoCodePage
    * I should see the edit hlp page tab elements
    * I add new promo codes to the page
    * I delete the selected hlp page

  Scenario: Cancel a created PromoCodePage
    * I create a new PromoCodePage
    * I cancel the selected hlp page
    * I should be on the HLP_Test_Partner_Pages page
    * I delete the original promocode page

  Scenario: Cancel an uncreated PromoCodePage
    * I fill out the data for the PromoCodePage
    * I cancel the selected hlp page

  Scenario: Duplicate an PromoCodePage
    * I create a new PromoCodePage
    * I duplicate the selected HLP Page
    * The PromoCodePage name should have copy appended at the end
    * I delete the HLP page duplicate
    * I delete the original promocode page

  Scenario: Preview an PromoCodePage
    * I create a new PromoCodePage
    * I add new promo codes to the page
    * I preview the selected HLP page
    * I verify all the elements on the preview PromoCodePage
    * I delete the selected hlp page
    
 @refactor
  Scenario: Launch an PromoCodePage
    * I create a new PromoCodePage
    * I add new promo codes to the page
    * I launch the HLP page
    * I click to see the live hlp PromoCodePage
    * I verify all the elements on the Live PromoCodePage
    * I verify the HLP page offer button redirects the user to IDP-IVA
    * I delete the selected hlp page
