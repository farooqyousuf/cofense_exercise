@regression @iva @military @desktop
Feature: Military verification using document upload

  Background:
    * I visit IDP through the "military" policy
    * I create a Military Document page object
    * I click on the Sign Up link
    * I sign up as a new user
    * I click on the Military Verify by uploading documentation link
    * I click on the Begin link

  @smoke @delete_current_user_email @doc
  #unique doc upload and user creds have to pass experian/preciseID
  Scenario: Successful verification as a Service Member
    * I verify using military documentation for "Service Member"
    * I approve the document in the IDme support tool
    * I should be successfully verified as "Service Member"
    * I verify user level properties for "Mil Doc Service Member"

  @delete_current_user_email
  Scenario: Successful verification as a Veteran
    * I verify using military documentation for "Veteran"
    * I approve the document in the IDme support tool
    * I should be successfully verified as "Veteran"
    * I verify user level properties for "Mil Doc Veteran"

  @delete_current_user_email
  Scenario: Successful verification as a Retiree
    * I verify using military documentation for "Retiree"
    * I approve the document in the IDme support tool
    * I should be successfully verified as "Retiree"
    * I verify user level properties for "Mil Doc Retiree"

  @delete_current_user_email
  Scenario: Successful verification as a Military Spouse
    * I verify using military documentation for "Military Spouse"
    * I approve the document in the IDme support tool
    * I should be successfully verified as "Military Spouse"
    * I verify user level properties for "Mil Doc Mil Spouse"

  @delete_current_user_email
  Scenario: Successful verification as a Military Family
    * I verify using military documentation for "Military Family"
    * I approve the document in the IDme support tool
    * I should be successfully verified as "Military Family"
    * I verify user level properties for "Mil Doc Mil Family"

  @wip @delete_mil_doc_multi_family_users
  Scenario: Disallow second spouse and fourth family member to verify
    * I verify using military documentation for "Service Member"
    * I approve the document in the IDme support tool
    * I clear the session from Authority
    * Multi-spouse: I verify "first" spouse via "mil doc"
    * Multi-family: I verify "first" family via "mil doc"
    * Multi-family: I verify "second" family via "mil doc"
    * Multi-family: I verify "third" family via "mil doc"
    * Multi-spouse: I verify "second" spouse via "mil doc" is not allowed to verify
    * Multi-family: I verify "fourth" family via "mil doc" is not allowed to verify

  @delete_current_user_email
  Scenario: Denied attempt for Military Document verification (Error code 15)
    * I submit the military document verification form as a "denied" record
    * I should see the error message "We're sorry, but we were unable to verify the information you provided. The information entered must match the information on official records. Note: If you've recently had a name change, try your maiden or prior name."
    * I verify the attempt is marked as "DENIED"

  @delete_experian_user1 @delete_current_user_email
  Scenario: Dupe attempt test for Military Document (Error code 77)
    * I verify using military documentation for "Service Member"
    * I approve the document in the IDme support tool
    * I clear the session from Authority
    * I create a new account after clearing my old "military" session
    * I click on the Military Verify by uploading documentation link
    * I click on the Begin link
    * I verify using a duplicate "Military Document" record
    * I should see the error message "We’re sorry, but we are unable to verify your credentials with the information you provided."
    * I verify the attempt is marked as "DUPLICATE"

  @delete_experian_user1 @delete_current_user_email
  Scenario: Prompt Error Code 78
    * I verify using military documentation for "Service Member"
    * I approve the document in the IDme support tool
    * I clear the session from Authority
    * I create a new account after clearing my old "military" session
    * I click on the Military Verify by uploading documentation link
    * I click on the Begin link
    * I submit the military document verification form as a "second unique user" record
    * I should see the error message "We’re sorry, but we were unable to verify your credentials with the document you provided. Please see our Support page for document specifications, or try another verification option."

  Scenario: Successfully prompt for all required fields for Service Member
    * I submit the empty military document form for "Service Member"
    * I should see error messages on required fields for "Military Document"

  Scenario: Successfully prompt for all required fields for Veteran
    * I submit the empty military document form for "Veteran"
    * I should see error messages on required fields for "Military Document"

  Scenario: Successfully prompt for all required fields for Retiree
    * I submit the empty military document form for "Retiree"
    * I should see error messages on required fields for "Military Document"

  Scenario: Successfully prompt for all required fields for Military Spouse
    * I submit the empty military document form for "Military Spouse"
    * I should see error messages on required fields for "Military Document Family"

  Scenario: Successfully prompt for all required fields for Military Family
    * I submit the empty military document form for "Military Family"
    * I should see error messages on required fields for "Military Document Family"

# commented out supporter as this option is not being used in production currently
# Scenario: Successfully prompt for all required fields for Military Supporter
#     * I submit the empty military document form for "Military Supporter"
#     * I should see error messages on required fields for "Military Document"

# commented out supporter as this option is not being used in production currently
# @delete_current_user_email
# Scenario: Successful verification as a Military Supporter
#   * I verify using military documentation for "Military Supporter"
#   * I approve the document in the IDme support tool
#   * I should be successfully verified as "Military Supporter"
