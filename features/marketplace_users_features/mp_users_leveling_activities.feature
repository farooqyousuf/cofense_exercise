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

     @facebook_connect
     Scenario: Authorize a Social Media Account - Connect to Facebook
       * I get the "vip_uid" user achievements progress
       * I check the Connect Your Facebook activity card
       * I Connect My Facebook Account
       * I should see successful flash message with "Facebook account connected"
       * I get the "vip_uid" user achievements progress after I connected My Facebook Account
       * I check the Connect Your Facebook activity card after I connected My Facebook Account

     @twitter_connect
     Scenario: Authorize a Social Media Account - Connect to Twitter
       * I get the "vip_uid" user achievements progress
       * I check the Connect Your Twitter Account activity card
       * I Connect My Twitter Account
       * I should see successful flash message with "Twitter account connected"
       * I get the "vip_uid" user achievements progress after I connected My Twitter Account
       * I check the Connect Your Twitter Account activity card after I connected My Twitter Account

     @linkedin_connect
     Scenario: Authorize a Social Media Account - Connect to LinkedIn
       * I get the "vip_uid" user achievements progress
       * I check the Connect Your LinkedIn Account activity card
       * I Connect My LinkedIn Account
       * I should see successful flash message with "LinkedIn account connected"
       * I get the "vip_uid" user achievements progress after I connected My LinkedIn Account
       * I check the Connect Your LinkedIn Account activity card after I connected My LinkedIn Account
