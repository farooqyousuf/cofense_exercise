Feature: Test Direct API Header Authorization

  Scenario: Successfully POST valid attributes to ARCS
    * I set valid authorization header
    * I set "valid" user attributes
    * I send a POST request to ARCS
    * I verify that I authenticated with "valid" attributes

  Scenario: Successfully receive valid attributes of user
    * I set valid authorization header
    * I set "valid" user attributes
    * I send a POST request to ARCS
    * I verify the user's "valid" military attributes is received

  Scenario: Successfully POST missing attributes to ARCS
    * I set valid authorization header
    * I set "missing" user attributes
    * I send a POST request to ARCS
    * I verify that I authenticated with "missing" attributes

  Scenario: Successfully receive missing attributes of user
    * I set valid authorization header
    * I set "missing" user attributes
    * I send a POST request to ARCS
    * I verify the user's "missing" military attributes is received
    
