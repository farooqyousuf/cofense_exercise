@regression @ios @mobile_iva
Feature: Identity Verification via mobile

  Background:
    * I set the mobile External Vendor Environment to "Staging"
    # * I set the External Vendor Environment to "Staging"
    * I create "MilitaryDoc, SupportTool, SupportToolDocs" page objects

  @smoke @delete_current_user_email
  Scenario: Successful verification as a Service Member
    * I visit IDP through the "military" policy
    * I pry
    * I click on the Sign Up link
    * I sign up as a new user
    * I click on the Military Verify by uploading documentation link
    * I click on the Begin link
    * I verify using military documentation for "Service Member"
    # * I verify using military documentation for "Service Member" via mobile
    # * I approve the document in the IDme support tool
    * I approve the document in the IDme support tool via mobile
    * I should be successfully verified as "Service Member"
    * I verify user level properties for "Mil Doc Service Member"

  # @smoke
  # Scenario: Successful login
  #   * I visit IDP through the "shop" policy
  #   * I login as a "Unverified" user
  #   * I should be successfully authenticated
