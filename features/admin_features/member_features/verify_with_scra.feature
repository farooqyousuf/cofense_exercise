@admin @user @regression
Feature: Verify users with SCRA using admin tool

  Background:
    * I visit IDP through the "military" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I should be on the military verification screen
    * I login the admin tool
    * I visit "VerifyWithScra"

  @delete_user
  Scenario: Successful Verification as a Service Member through the Admin Tool
    * I verify with SCRA for "Service Member"
    * I should be successfully verified as a "Service Member"

  @delete_user
  Scenario: Successful Verification as a Veteran through the Admin Tool
    * I verify with SCRA for "Veteran"
    * I should be successfully verified as a "Veteran"

  @delete_user
  Scenario: Successful Verification as a Retiree through the Admin Tool
    * I verify with SCRA for "Retiree"
    * I should be successfully verified as a "Retiree"

  @delete_user
  Scenario: Successful Verification as a Military Spouse through the Admin tool
    * I verify with SCRA for "Military Spouse"
    * I should be successfully verified as a "Military Spouse"

  @delete_user
  Scenario: Successful Verification as a Military Family through the Admin tool
    * I verify with SCRA for "Military Family"
    * I should be successfully verified as a "Military Family"

  @delete_user
  Scenario: Successful prompt for all required fields for Service Member
    * I submit the empty SCRA form for "Service Member" in the Admin tool
    * I should see error messages on required fields for "Service Member" in the Admin tool
    * I should see red highlighted errors for "Service Member" in the Admin tool

  @delete_user
  Scenario: Successful prompt for all required fields for Veteran
    * I submit the empty SCRA form for "Veteran" in the Admin tool
    * I should see error messages on required fields for "Veteran" in the Admin tool
    * I should see red highlighted errors for "Veteran" in the Admin tool

  @delete_user
  Scenario: Successful prompt for all required fields for Retiree
    * I submit the empty SCRA form for "Retiree" in the Admin tool
    * I should see error messages on required fields for "Retiree" in the Admin tool
    * I should see red highlighted errors for "Retiree" in the Admin tool

  @delete_user
  Scenario: Successful prompt for all required fields for Military Spouse
    * I submit the empty SCRA form for "Military Spouse" in the Admin tool
    * I should see error messages on required fields for "Military Spouse" in the Admin tool
    * I should see red highlighted errors for "Military Spouse" in the Admin tool

  @delete_user
  Scenario: Successful prompt for all required fields for Military Family
    * I submit the empty SCRA form for "Military Family" in the Admin tool
    * I should see error messages on required fields for "Military Family" in the Admin tool
    * I should see red highlighted errors for "Military Family" in the Admin tool
