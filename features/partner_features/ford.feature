@partners @ford @version2
Feature: Test the Ford Partner Integration
  @newset
  Scenario: Test Ford Military Integration for inactive service member
    * ford - I visit the Military Integration Page
    * ford - I sign in with IDP
    * ford - I verify the Troop ID Integration for inactive member

  Scenario: Test Ford First Responder Integration
    * ford - I visit the First Responder Integration Page
    * ford - I sign in with IDP
    * ford - I verify the First Responder Integration

  Scenario: Test Ford Military for active service member
    * ford - I visit the Military Integration Page
    * ford - I sign in with IDP as active member
    * ford - I verify the Troop ID Integration for active member
