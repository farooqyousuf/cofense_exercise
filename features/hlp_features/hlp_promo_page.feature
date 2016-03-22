@regression @hlp @hlp_admin @hlp_promo_page

Feature: Test the HLP DocumentPage functionality

Background:
  * I visit "HlpPartnerIndexPage"
  * I login with Authority
  * I check if page name has been already taken for the "PromoCodePage"
  * I visit the Add PromoCodePage

  @smoke
  Scenario: Add a new PromoCodePage
    * I create a new PromoCodePage
    * I should see PromoCodePage edit page elements
    * I add new promo codes to the page
    * I delete the PromoCodePage

  Scenario: Cancel a created PromoCodePage
    * I create a new PromoCodePage
    * I cancel the PromoCodePage
    * I should be on the HLP_Test_Partner_Pages page
    * I delete the original promocode page

  Scenario: Cancel an uncreated PromoCodePage
    * I fill out the data for the GatedPage
    * I cancel the GatedPage

  Scenario: Duplicate an PromoCodePage
    * I create a new PromoCodePage
    * I duplicate the PromoCodePage
    * The PromoCodePage name should have copy appended at the end
    * I delete the PromoCodePage copy
    * I delete the original promocode page

  Scenario: Preview an PromoCodePage
    * I create a new PromoCodePage
    * I add new promo codes to the page
    * I preview the PromoCodePage
    * I verify all the elements on the preview PromoCodePage
    * I delete the PromoCodePage
   
  Scenario: Launch an PromoCodePage
    * I create a new PromoCodePage
    * I add new promo codes to the page
    * I launch the PromoCodePage
    * I live page the PromoCodePage
    * I verify all the elements on the Live PromoCodePage
    * I verify the PromoCode offer button redirects to IDP-IVA
    * I delete the PromoCodePage
