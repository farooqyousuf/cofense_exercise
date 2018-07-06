@regression @iva @teacher @desktop @doc
Feature: Teacher verification via mobile

  Background:
    * I set the External Vendor Environment to "Staging"
    * I create "SupportTool, SupportToolDocs, TeacherDoc, UserEdit" page objects
    * I open a new window
    * I visit IDP through the "teacher" policy
    * I click on the Sign Up link
    * I sign up as a new user

  @smoke @delete_current_user_email
  #experian/precise id check
  Scenario: Successful verification as a Teacher using document upload
    * I click on the teacher verify using documentation link
    * I select the teacher state "Maryland"
    * I click on the Begin link
    * I verify using teacher documentation
    * I approve the document in the IDme support tool via mobile
    * I should be successfully verified
    * I verify user level properties for "Teacher Doc Upload"
