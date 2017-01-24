@regression @iva @responder @desktop @emt
Feature: Responder verification as an nationally certified EMT

  Background:
    * I visit IDP through the "responder" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I should be on the responder verification screen

  @smoke @delete_natl_emt
  Scenario: Successful verification
    * I verify using nationally certified EMT credentials
    * I complete the verification process
    * I should be successfully verified as "EMT"

  Scenario: Denied attempt for emt national verification
    * I submit the emt national verification form as a "denied" record
    * I should see the red alert box error message "We're sorry, but we were unable to verify your EMT status with the information you provided. Please confirm your Registry Number by visiting the National Registry of Emergency Medical Technicians website. For additional information, please see our Support page."
    * I verify the attempt is marked as "DENIED"

  @delete_natl_emt_dupe
  Scenario: Dupe attempt test for emt national
    * I verify using nationally certified EMT credentials
    * I complete the verification process
    * I clear the session from Authority
    * I create a new account after clearing my old "responder" session
    * I verify using a duplicate "EMT National" record
    * I should see the red alert box error message "We're sorry, but we were unable to verify your EMT status with the information you provided. Please confirm your Registry Number by visiting the National Registry of Emergency Medical Technicians website. For additional information, please see our Support page."
    * I verify the attempt is marked as "DUPLICATE"

  Scenario: Successfully prompt for all required fields
    * I submit the empty National EMT form
    * I should see error messages on required fields for "National EMT"






