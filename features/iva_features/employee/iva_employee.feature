@regression @iva @employee @desktop
Feature: Employee verification using employee email

  Background:
    * I create "AdminUsers, AdminTool, IVAEmployee, AdminSettings" page objects
    * I set the External Vendor Environment to "Staging"
    * I visit IDP through the "employee" policy
    * I create a Employee page object
    * I click on the Sign Up link
    * I sign up as a new user
    * I click on the Begin link

  @smoke @delete_current_user_email
  #unique email address
  Scenario: Successful verification with an Employee email
    * I submit the employee verification form as a "unique" record
    * I submit the verification code for "Employee Email"
    * I should be successfully verified as "Test Employer"
    * I verify user level properties for "Employee"

  @delete_current_user_email @ignore
  #this test will fail b/c there form fields need to be fixed
  Scenario: Successfully prompt for all required fields
    * I submit the empty employee form
    * I should see error messages on required fields for "Employee"
