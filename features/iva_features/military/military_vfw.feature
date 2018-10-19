@regression @iva @military
Feature: Military verification with VFW number

  Background:
    * I set the External Vendor Environment to "Staging"
    * I visit IDP through the "vfw" policy
    * I create "MilitaryEmail, MilitaryVFW" page objects
    * I click on the Sign Up link
    * I sign up as a new user
    * I click on the Begin link

  @smoke @delete_current_user_email
  Scenario: Successfully add a valid vfw number to military user
    * I add a "valid" vfw number to user
    * I click on "Continue"
    * I authorize the attribute release
    * I should be successfully verified as "VFW"

  @delete_current_user_email
  Scenario: Dupe valid vfw number added to military user
    * I add a "duplicate" vfw number to user
    * I should see the error message "We’re sorry, it appears you have already verified your VFW membership status on a different account. Please sign in using your existing credentials."
    * I verify the attempt is marked as "DUPLICATE"
