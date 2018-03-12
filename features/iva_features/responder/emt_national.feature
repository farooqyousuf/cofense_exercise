@regression @iva @responder @desktop @emt
Feature: Responder verification as an nationally certified EMT

  Background:
    * I set the External Vendor Environment to "Staging"
    * I create a EMT National page object
    * I visit IDP through the "responder" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I click on the Verify using EMT National link
    * I click on the Begin link

  @smoke @delete_current_user_email
  Scenario: Successful verification
    * I verify using nationally certified EMT credentials
    * I should be successfully verified as "EMT"
    * I verify user level properties for "EMT National"

  @delete_current_user_email
  Scenario: Denied attempt for emt national verification (Error code 25)
    * I submit the emt national verification form as a "denied" record
    * I should see the error message "We're sorry, but we are unable to verify your EMT status with the information you provided. Please confirm your Registry Number by visiting the National Registry of Emergency Medical Technicians website. For additional information, please see our Support page."
    * I verify the attempt is marked as "DENIED"

  @delete_current_user_email @delete_natl_emt
  Scenario: Dupe attempt test for emt national
    * I verify using nationally certified EMT credentials
    * I clear the session from Authority
    * I create a new account after clearing my old "responder" session
    * I click on the Verify using EMT National link
    * I click on the Begin link
    * I verify using a duplicate "EMT National" record
    * I should see the error message "We’re sorry, it appears you have already verified your EMT status on a different account. Please sign in using your existing credentials."
    * I verify the attempt is marked as "DUPLICATE"

  @delete_current_user_email
  Scenario: Prompt Error Code 26
    * I submit the emt national verification form as a "expired" record
    * I should see the error message "We're sorry, but it appears that your NREMT registration has expired. Please update your national registration and try again, or visit our Support page for additional information."

  @delete_current_user_email
  Scenario: Successfully prompt for all required fields
    * I submit the empty National EMT form
    * I should see error messages on required fields for "National EMT"
