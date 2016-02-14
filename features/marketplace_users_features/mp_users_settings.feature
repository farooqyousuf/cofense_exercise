@regression @marketplace @mp_user_settings
Feature: Test the MP_users Account & Profile settings

    Background:
      * I GET MP_User info for "vip_uid"
      * I check the "vip_uid" user level is "vip"
      * I visit "MarketplaceLandingPage"
      * I click on SignIn link
      * I login to marketplace as a "vip" user
      * I visit "MarketplaceUserSettingsPage"
      * I create a Marketplace User Setting Page Object

    @mp_user_profile_update
    Scenario: Update Profile - I Change the User Profile Info
      * I update the user profile name and submit.
      * I should see successful flash message with "Profile updated"

    @mp_email_subscribe
    Scenario: Update Profile - Subscribe to ID.me offers and discounts
      * I check the user subscribed checkbox and save the Changes
      * I should see successful flash message with "Profile updated"
      * I check that user has been subscribed in marketplace

    @incorrect
    Scenario Outline: Update Profile - I enter incorrect profile info
      * I visit "MarketplaceUserAccountEditPage"
      * I create a Marketplace account edit page object
      * I enter "<user_password>" into user account password field
      * I enter "<confirm_password>" into confirm user account password field
      * I click update button
      * I should see "<error_message>" error message appear for user account
    Examples: Incorrect Password Entries
      | user_password | confirm_password | error_message                                       |
      | aaaaaaaa      |                  | Password must contain at least one number           |
      | aaaaaaaa1     |                  | Password must contain at least one uppercase letter |
      | AAAAAAAAAA1   |                  | Password must contain at least one lowercase letter |
      | Password1     | PuppyMonkey12    | Passwords do not match                              |
      | Password1     |                  | Confirm password                                    |

    @mp_password
    Scenario: Update account - I successfully change my password
      * I visit "MarketplaceUserAccountEditPage"
      * I create a Marketplace account edit page object
      * I update the user account password
      * I check that the user account password has successfully updated.
