@regression @mobile_iva @mobile_student @smoke
Feature: Student Identity Verification via mobile

  Background:
    * I set the External Vendor Environment to "Staging"
    * I create "StudentDoc, StudentCreds, AdminUsers, AdminTool, AdminTeacherVerifs, SupportTool, SupportToolVerificationAttempts" page objects
    * I open a new window
    * I visit IDP through the "student" policy
    * I click on the Sign Up link
    * I sign up as a new user

  @delete_current_user_email
  Scenario: Successful verification as a Student using Student Credentials
    * I click on the Verify using your student credentials link
    * I create a Student Creds page object
    * I click on the Begin link
    * I submit the student credentials verification form as a "unique" record
    * I should be successfully verified
    * I verify user level properties for "Student Credentials"

  @delete_current_user_email
  #unique dob/ssn and vetted by Experian/PreciseID, have to use their test data
  Scenario: Successful verification as a Student using Student Doc Upload
    * I click on the Verify by uploading documentation link
    * I click on the Begin link
    * I verify using student documentation
    * I approve the document in the IDme support tool via mobile
    * I should be successfully verified
    * I verify user level properties for "Student Doc Upload"
