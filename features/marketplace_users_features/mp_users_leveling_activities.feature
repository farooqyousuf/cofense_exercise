@regression @marketplace @mp_users @mp_leveling_activity
Feature: Test the MP_users Leveling Activities (Client - Workflow/Action)

  Background:
     * I GET MP_User info for "vip_uid"
     * I check the "vip_uid" user level is "vip"
     * I visit "MarketplaceLandingPage"
     * I click on SignIn link
     * I login to marketplace as a "vip" user
     * I click on Username link
     * The page url should be the CashBack Page

     Scenario: Authorize a Social Media Account - Connect to Facebook
       * I get the "vip_uid" user achievements progress
       * I check the Connect Your Facebook activity card
       * I Connect My Facebook Account
       * I should see successful flash message with "Facebook account connected"
       * I get the "vip_uid" user achievements progress after I connected My Facebook Account
       * I check the Connect Your Facebook activity card after I connected My Facebook Account
       * The notifications popover list should have "Connected Facebook account"
