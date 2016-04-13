@partners @ford @version2
Feature: Test the Ford Partner Integration

  Scenario: Test Ford Military Integration
    * ford - I visit the Military Integration Page
    * ford - I sign in with IDP
    * ford - I verify the Troop ID Integration for inactive member
    @firstresponderford
  Scenario: Test Ford First Responder Integration
    * ford - I visit the First Responder Integration Page
    * ford - I sign in with IDP
    * ford - I verify the First Responder Integration
