@partners @version2 @goruck
Feature: Test Goruck Partner Integration

  Scenario: Test Goruck Military Integration
    * GORUCK MILITARY - I add a item to the cart
    * GORUCK MILITARY - I sign in with my IDme Student account
    * GORUCK MILITARY - I verify that my student discount was applied

  Scenario: Test Goruck Teacher Integration
    * GORUCK TEACHER - I add a item to the cart
    * GORUCK TEACHER - I sign in with my IDme Student account
    * GORUCK TEACHER - I verify that my student discount was applied

  Scenario: Test Goruck First Responder Integration
    * GORUCK FIRST RESPONDER - I add a item to the cart
    * GORUCK FIRST RESPONDER - I sign in with my IDme Student account
    * GORUCK FIRST RESPONDER - I verify that my student discount was applied

  Scenario: Test Goruck Student Integration
    * GORUCK STUDENT - I add a item to the cart
    * GORUCK STUDENT - I sign in with my IDme Student account
    * GORUCK STUDENT - I verify that my student discount was applied
