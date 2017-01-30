@partner @yeti @version2 @desktop
Feature: Test the ID.me YETI integration

  Scenario: Test the YETI Military Partner Integration
    * YETI- I add an item to the cart
    * YETI- I verify my "troop_id" through ID.me
    * YETI- I verify my "troop_id" discount has been applied

  Scenario: Test the YETI First Responser Partner Integration
    * YETI- I add an item to the cart
    * YETI- I verify my "responder_id" through ID.me
    * YETI- I verify my "responder_id" discount has been applied

  Scenario: Test the YETI Government Partner Integration
    * YETI- I add an item to the cart
    * YETI- I verify my "government_id" through ID.me
    * YETI- I verify my "government_id" discount has been applied
