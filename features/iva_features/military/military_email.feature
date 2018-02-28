@regression @iva @military @email @desktop
Feature: Military verification using .mil email

  Background:
    * I set the External Vendor Environment to "Staging"
    * I visit IDP through the "military" policy
    * I create "MilitaryEmail" page objects
    * I click on the Sign Up link
    * I sign up as a new user
    * I should be on the military verification screen

  @smoke @delete_current_user_email
  #unique last name/email to pass verification
  Scenario: Successful verification with a military email as Service Member
    * I verify using military email information for "Service Member"
    * I submit the verification code for "Military Email Code"
    * I should be successfully verified as "Service Member"
    * I verify user level properties for "Mil Email Service Member"

  @delete_current_user_email
  Scenario: Successful verification with a military email as Military Spouse
    * I verify using military email information for "Military Spouse"
    * I submit the verification code for "Military Email Code"
    * I should be successfully verified as "Military Spouse"
    * I verify user level properties for "Mil Email Mil Family"

  @delete_current_user_email
  Scenario: Successful verification as Military Family
    * I verify using military email information for "Military Family"
    * I submit the verification code for "Military Email Code"
    * I should be successfully verified as "Military Family"
    * I verify user level properties for "Mil Email Mil Family"

  @delete_current_user_email
  Scenario: Denied attempt for military email verification (Error code A0506)
    * I submit the military email verification form as a "denied" record
    * I should see the error message "We're sorry, but the name you entered does not match the name specified by the email address. Please try a different verification option."
    * I verify the attempt is marked as "DENIED"

  @delete_current_user_email
  Scenario: Dupe user attempt for military email verification (Error code A0500)
    * I submit the military email verification form as a "duplicate" record
    * I should see the error message "We’re sorry, but we are unable to verify your military status with the information you provided."
    * I verify the attempt is marked as "DUPLICATE"

  @delete_current_user_email
  Scenario: Prompt Error Code 14
    * I submit the military email verification form as a "unique" record
    * I submit an invalid verification code
    * I should see the red error "The code you entered does not match." under the textfield

  @delete_current_user_email
  Scenario: Successfully prompt for all required fields for Service Member
    * I submit the empty military email form for "Service Member"
    * I should see error messages on required fields for "Military Email"

  @delete_current_user_email
  Scenario: Successfully prompt for all required fields for Military Spouse
    * I submit the empty military email form for "Military Spouse"
    * I should see error messages on required fields for "Military Email Family"

  @delete_current_user_email
  Scenario: Successfully prompt for all required fields for Military Family
    * I submit the empty military email form for "Military Family"
    * I should see error messages on required fields for "Military Email Family"
