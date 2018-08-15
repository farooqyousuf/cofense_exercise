@regression @iva @government @desktop
Feature: Government verification using .gov email

  Background:
    * I create "AdminUsers, AdminTool, IVAGovernment, AdminSettings" page objects
    * I set the External Vendor Environment to "Staging"
    * I visit IDP through the "government" policy
    * I create a Government page object
    * I click on the Sign Up link
    * I sign up as a new user
    * I click on the Begin link

  # TODO: break this out into the initial email step, admin step, code step
  @smoke @delete_current_user_email
  #unique email address
  Scenario: Successful verification with a Government email
    * I submit the government verification form as a "unique" record
    * I submit the verification code for "Government Email"
    * I should be successfully verified as "Federal"
    * I verify user level properties for "Government"

  @delete_current_user_email
  Scenario: Successfully prompt for all required fields
    * I submit the empty government form
    * I should see error messages on required fields for "Government"

  @delete_current_user_email
  Scenario: Dupe check attempt for Government verification (Error code 79)
    * I submit the government verification form as a "dupe" record
    * I should see the error message "We’re sorry, it appears you have already verified your government employee status on a different account. Please sign in using your existing credentials."
    * I verify the attempt is marked as "DUPLICATE"

  @delete_current_user_email
  Scenario: Denied attempt for Government verification (Error code 23)
    * I submit the government verification form as a "denied" record
    * I should see the error message "Please provide a valid government email address."
    * I verify the attempt is marked as "DENIED"

  @delete_current_user_email
  Scenario: Prompt Error Code 24
    * I submit the government verification form as a "unique" record
    * I submit an invalid verification code
    * I should see the error message "We could not find a valid email confirmation request. Please try again."
