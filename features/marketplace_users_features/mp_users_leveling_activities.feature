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
       * I should see successful flash message with "Third party account connection not authorized."

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

     @demographic_survey
     Scenario: Complete A Demographic Survey
       * I get the "vip_uid" user achievements progress
       * I check the Complete A Survey activity card
       * I visit "NewSurveyPage"
       * I submit a empty Demographic Survey form
       * I should see "4" correct error messages when submitting a empty form
       * I click on the Return to the cash back program button
       * I correctly complete a Demographic Survey
       * I should see successful flash message with "Thank you for submitting your survey."
       * I get the "vip_uid" user achievements progress after I Completed A Survey
       * I check the Complete A Survey activity card after I Completed A Survey

     @invite_store
     Scenario: Submit Invite Store form
       * I get the "vip_uid" user achievements progress
       * I check the Invite A Store activity card
       * I visit "StoreInvitePage"
       * I submit a empty Invite A Store form
       * I should see "2" correct error messages when submitting a empty form
       * I click on the Return to the cash back program button
       * I Invite A Store
       * I should see successful flash message with "Stores have been invited"
       * I get the "vip_uid" user achievements progress after I Invited A Store
       * I check the Invite A Store activity card after I Invited A Store

     @refer_friends_batch_invitation
     Scenario: Send Email Invitations - Batch Invitation
       * I get the "vip_uid" user achievements progress
       * I check the Refer A Friend activity card
       * I visit "InvitationProvidersPage"
       * I click on the Return to the cash back program button
       * I visit "BatchInvitationPage"
       * I submit Batch Invitations form with no email address and I should see a error message
       * I submit Batch Invitations form with incorrect email address and I should see the error message "Invalid Emails:"
       * I Send A Correct Batch Invitation of Emails
       * I should see successful flash message with "You successfully invited contacts."
       * I get the "vip_uid" user achievements progress after I submitted Batch Invitations form
       * I check the Refer A Friend activity card after I submitted Batch Invitations form

     @refer_25_friends
     Scenario: Send Email Invitations - refer 25 friends
       * I check user activity level before referring 25 friends
       * I incorrectly submit to refer 25 email invitations
       * I correctly submit to refer 25 email invitations
       * I check user activity level after referring 25 friends
