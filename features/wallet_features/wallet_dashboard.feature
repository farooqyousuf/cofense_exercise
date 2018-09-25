@regression @wallet @desktop @wallet_dashboard
Feature: Test Wallet Dashboard Page Feature

  Background:
    * I create "WalletHomepage, WalletDashboard, WalletMyids, ShopLandingPage" page objects
    * I visit "WalletHomepage"
    * I click on the Wallet Sign In Link
    * I login to wallet as a "Military" user

  @wip @ignore
  Scenario: Verify Wallet Main Navigation bar
    * I verify ID.me logo is present
    * I verify that the Wallet nav "About" tab redirects to page
    * I click on the Wallet My Account link
    * I verify that the Wallet nav "Shop" tab redirects to page
    * I click on the Shop "My Account" navigation link
    * I verify that the Wallet nav "Wallet" tab redirects to page
    * I click on the Wallet My Account link
    * I verify that the Wallet nav "Business" tab redirects to page

  Scenario: Verify Wallet Sub-Nav bar
    * I verify that the sub-nav "Dashboard" link redirects to page
    * I verify that the sub-nav "IDs and Logins" link redirects to page
    * I verify that the sub-nav "Settings" link redirects to page
    * I verify that the sub-nav "Activity" link redirects to page

  Scenario: Verify Wallet Shared Side Nav
    * I click on the shared side navigation
    * I verify user email is displayed
    * I verify membership date is displayed correctly
    * I verify that View Full Profile link directs me to correct page

  Scenario: Verify Dashboard Components
    * I should be on the Wallet dashboard page url
    * I verify required main header sections are visible within home page
    * I verify that IDs toggle button directs me to corresponding view
    * I verify that Logins toggle button directs me to corresponding view
    * I verify that 'View All' links take me to the correct urls
    * I verify 'Add ID' button triggers affinity group modal
    * I verify Teacher ID button
    * I verify Responder ID button
    * I verify Government ID button
    * I verify Student ID button
