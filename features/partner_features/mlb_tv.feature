@partners @mlb_tv @version2 @desktop
Feature: Test the ID.me MLB.tv Integration

  Background:
    * MLBTV - I apply for a yearly premium subscription

  @troop_id @windows @sauce
  Scenario: Test MLB.tv Military Partner Integration
    * MLBTV - I apply the Troop ID discount
    * MLBTV - I verify the Troop ID discount has been applied
