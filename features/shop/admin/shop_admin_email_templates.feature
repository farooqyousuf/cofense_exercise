@regression @desktop @shop_admin_email_template

Feature: Shop admin email template generator

  Background:
    * I create "ShopAdminDashboard, ShopAdminEmailGenerator" page objects
    * I visit "ShopAdminDashboard"
    * I login with Authority
    * I visit "ShopAdminEmailGenerator"

  Scenario: Successfully create a new weekly email template
    * I navigate to the create a new email template page
    * I submit a valid new weekly email template with no offers
    * I verify that the new email template has been saved
    * I delete the new email template
