@partners @version2 @goruck
Feature: Test the ID.me Goruck Partner Integration

  Scenario: Test Goruck Military Integration
    * GORUCK- I add a item to the cart
    * GORUCK- I sign in with my IDme "troop_id" account
    * GORUCK- I verify that my "troop_id" discount was applied

  Scenario: Test Goruck Teacher Integration
    * GORUCK- I add a item to the cart
    * GORUCK- I sign in with my IDme "teacher_id" account
    * GORUCK- I verify that my "teacher_id" discount was applied

  Scenario: Test Goruck Student Integration
    * GORUCK- I add a item to the cart
    * GORUCK- I sign in with my IDme "student_id" account
    * GORUCK- I verify that my "student_id" discount was applied

    Scenario: Test Goruck First Responder Integration
    * GORUCK- I add a item to the cart
    * GORUCK- I sign in with my IDme "responder_id" account
    * GORUCK- I verify that my "responder_id" discount was applied

    Scenario: Test Goruck Government Integration
    * GORUCK- I add a item to the cart
    * GORUCK- I sign in with my IDme "government_id" account
    * GORUCK- I verify that my "government_id" discount was applied
