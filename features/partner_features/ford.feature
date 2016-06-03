@partners @ford @version2 @desktop
Feature: Test the Ford Partner Integration

  Scenario: Test Ford First Responder Integration
    * ford - I visit the First Responder Integration Page
    * ford - I sign in with IDP
    * ford - I verify the First Responder Integration

  Scenario: Test Ford Military for Military member
    * ford - I visit the Military Integration Page
    * ford - I sign in with IDP as military member
    * ford - I verify the Troop ID Integration for military member
