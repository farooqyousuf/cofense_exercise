@regression @shop @shop_user_group_affiliations @desktop
Feature: Test User Group Affiliation Page & Verification Features

  Background:
    * I create "StudentCreds, ShopGroupAffiliationsPage, ShopLandingPage, AdminUsers, TeacherDoc, TeacherLookup, AdminTool, AdminTeacherVerifs, IVAGovernment" page objects
    * I visit "ShopLandingPage"
    * I click on the Shop Sign Up link
    * I sign up as a new user
    * I visit group affiliations from the Shop homepage

  Scenario: Check Group Affiliations page and tabs
    * I expect to be at the group affiliations page
    * I expect to see the verify group affiliations dashboard
    * I expect that all groups are marked as Instant VIP

  @smoke
  Scenario: Verify a Military Group Affiliation
    * I select to verify the Military Group Affiliation
    * I should be on the military verification screen
    * I verify using military email information for "Service Member"
    * I submit the verification code for "Military Email Code"
    * I verify user "Military" Group Affiliation is approved on Shop

  Scenario: Verify a Student Group Affiliation
    * I select to verify the Student Group Affiliation
    * I should be on the student verification screen
    * I verify using student credentials
    * I verify user "Students" Group Affiliation is approved on Shop

  Scenario: Verify a Teacher Group Affiliation
    * I select to verify the Teacher Group Affiliation
    * I should be on the teacher verification screen
    * I click on the verify using teacher state lookup link
    * I select the teacher state "Delaware"
    * I click on the Begin link
    * I verify using teacher credentials with "no license and no ssn"
    * I "approve" the teacher verification in IDme admin
    * I verify user "Teachers" Group Affiliation is approved on Shop

  Scenario: Verify a Government Group Affiliation
    * I select to verify the Government Group Affiliation
    * I should be on the government verification screen
    * I submit the government verification form as a "unique" record
    * I submit the verification code for "Government Email"
    * I verify user "Government Employees" Group Affiliation is approved on Shop

  Scenario: Verify a First Responder Group Affiliation
    * I select to verify the First Responder Group Affiliation
    * I should be on the responder verification screen
    * I verify using a ProBoard Firefighter
    * I verify user "First Responders" Group Affiliation is approved on Shop
