@regression @hlp @hlp_admin
Feature: Test the HLP UngatedPage functionality

  Background:
    * I visit "HostedLandingPageHome"
    * I login with Authority
    * I check if page name has been already taken for the "temp_hlp_ungated"
    * I visit the Add UngatedPage page

  Scenario: Add a new Ungated page
    * I create a new UngatedPage
