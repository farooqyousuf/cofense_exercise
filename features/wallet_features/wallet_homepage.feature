@regression @wallet @desktop @wallet_homepage
Feature: Test Wallet Landing Page Feature

  Background:
    * I create "WalletHomepage" page objects
    * I visit "WalletHomepage"

  @smoke
  Scenario: Homepage Content Sections Displayed
    * I verify I am on the wallet homepage
    * I verify that the wallet home hero is displayed

  @smoke
  Scenario: Wallet User My Account link successfully redirects to IDP
    * I verify the wallet My Account links direct to idp

  Scenario: Wallet "For Business and Government" Navigation dropdown links successfully redirects
    * I verify the For Business and Government navigation dropdown link "Identity Verification"
    * I verify the For Business and Government navigation dropdown link "Document Verification"
    * I verify the For Business and Government navigation dropdown link "KYC Verification"
    * I verify the For Business and Government navigation dropdown link "SCRA Monitoring"
    * I verify the For Business and Government navigation dropdown link "Group Verification"
    * I verify the For Business and Government navigation dropdown link "Military"
    * I verify the For Business and Government navigation dropdown link "Students"
    * I verify the For Business and Government navigation dropdown link "Teachers"
    * I verify the For Business and Government navigation dropdown link "First Responders"
    * I verify the For Business and Government navigation dropdown link "Government Employees"
    * I verify the For Business and Government navigation dropdown link "Government"
    * I verify the For Business and Government navigation dropdown link "Healthcare"
    * I verify the For Business and Government navigation dropdown link "Financial Services"
    * I verify the For Business and Government navigation dropdown link "Ecommerce"
    * I verify the For Business and Government navigation dropdown link "Request a Demo"

  Scenario: Wallet "For Individuals" Navigation dropdown links successfully redirects
    * I verify the For Individuals navigation dropdown link "Accessing Government Services"
    * I verify the For Individuals navigation dropdown link "Qualifying for Group Discounts"
    * I verify the For Individuals navigation dropdown link "Shop Now"
