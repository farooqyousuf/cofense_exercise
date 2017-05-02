@regression @iva @government @desktop
Feature: Government verification using .gov email

  Background:
    * I visit IDP through the "government" policy
    * I click on the Sign Up link
    * I sign up as a new user
    * I click on the Begin link

  # TODO: break this out into the initial email step, admin step, code step
  @smoke @delete_current_username
  #unique email address
  Scenario: Successful verification with a Government email
    * I submit the government verification form as a "unique" record
    * I submit the verification code for "Government Email"
    * I should be successfully verified as "Federal"

  Scenario: Successfully prompt for all required fields
    * I submit the empty government form
    * I should see error messages on required fields for "Government"

  @delete_current_username
  Scenario: Dupe check attempt for Government verification (Error code 79)
    * I submit the government verification form as a "dupe" record
    * I should see the red alert box error message "We’re sorry, but we are unable to verify your credentials with the information you provided."
    * I verify the attempt is marked as "DUPLICATE"

  @delete_current_username
  Scenario: Denied attempt for Government verification (Error code 23)
    * I submit the government verification form as a "denied" record
    * I should see the red alert box error message "Please provide a valid government email address."
    * I verify the attempt is marked as "DENIED"

  @delete_current_username
  Scenario: Prompt Error Code 24
    * I submit the government verification form as a "unique" record
    * I submit an invalid verification code
    * I should see the red alert box error message "We’re sorry, but the code you entered didn’t match the last code we sent you. If you have requested multiple codes, please be sure to enter the most recent code we sent."

