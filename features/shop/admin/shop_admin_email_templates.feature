@regression @desktop @shop_admin_email_template

Feature: Shop admin email template generator

  Background:
    * I create "ShopAdminDashboard,ShopAdminEmailGenerator" page objects
    * I visit "ShopAdminDashboard"
    * I login with Authority
    * I visit "ShopAdminEmailGenerator"

  Scenario: Successfully create a new email template
    * I navigate to the create a new email template page
    * I submit a valid new email template
    * I verify that the new email template has been saved
