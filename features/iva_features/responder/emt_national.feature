@regression @iva @responder @desktop @emt
Feature: Responder verification as an nationally certified EMT

  Background:
    * I visit IDP through the "responder" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I click on the Verify using EMT National link
    * I click on the Begin link

  @smoke @delete_natl_emt
  Scenario: Successful verification
    * I verify using nationally certified EMT credentials
    * I should be successfully verified as "EMT"

  @delete_current_username
  Scenario: Denied attempt for emt national verification (Error code 25)
    * I submit the emt national verification form as a "denied" record
    * I should see the error message "We're sorry, but we were unable to verify your EMT status with the information you provided. Please confirm your Registry Number by visiting the National Registry of Emergency Medical Technicians website. For additional information, please see our Support page."
    * I verify the attempt is marked as "DENIED"

  @delete_natl_emt_dupe
  Scenario: Dupe attempt test for emt national
    * I verify using nationally certified EMT credentials
    * I clear the session from Authority
    * I create a new account after clearing my old "responder" session
    * I verify using a duplicate "EMT National" record
    * I should see the red alert box error message "We're sorry, but we were unable to verify your EMT status with the information you provided. Please confirm your Registry Number by visiting the National Registry of Emergency Medical Technicians website. For additional information, please see our Support page."
    * I verify the attempt is marked as "DUPLICATE"

 @delete_current_username
 Scenario: Prompt Error Code 26
    * I submit the emt national verification form as a "expired" record
    * I should see the red alert box error message "We're sorry, but it appears that your NREMT registration has expired. Please update your national registration and try again, or visit our Support page for additional information."

  Scenario: Successfully prompt for all required fields
    * I submit the empty National EMT form
    * I should see error messages on required fields for "National EMT"






