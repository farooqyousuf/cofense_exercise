@admin @user @regression
Feature: Verify users with SCRA using admin tool

  Background:
    * I visit IDP through the "military" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I should be on the military verification screen
    * I login the admin tool
    * I visit "VerifyWithScra"

  @delete_current_user_email
  Scenario: Successful Verification as a Service Member through the Admin Tool
    * I verify with SCRA for "Service Member"
    * I should be successfully verified as a "Service Member"

  @delete_current_user_email
  Scenario: Successful Verification as a Veteran through the Admin Tool
    * I verify with SCRA for "Veteran"
    * I should be successfully verified as a "Veteran"

  @delete_current_user_email
  Scenario: Successful Verification as a Retiree through the Admin Tool
    * I verify with SCRA for "Retiree"
    * I should be successfully verified as a "Retiree"

  @delete_current_user_email
  Scenario: Successful Verification as a Military Spouse through the Admin tool
    * I verify with SCRA for "Military Spouse"
    * I should be successfully verified as a "Military Spouse"

  @delete_current_user_email
  Scenario: Successful Verification as a Military Family through the Admin tool
    * I verify with SCRA for "Military Family"
    * I should be successfully verified as a "Military Family"

  Scenario: Duplicate attempt for SCRA verification through the Admin tool
    * I verify with SCRA for "Service Member"
    * I should be successfully verified as a "Service Member"
    * I clear the session from Authority
    * I login the admin tool
    * I visit "VerifyWithScra"
    * I submit the SCRA verification form through the admin tool as a "duplicate" record
    * I should see the red alert flash message
    * I verify the attempt is marked as "DUPLICATE"
