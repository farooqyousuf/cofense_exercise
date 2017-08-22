Feature: Test Direct API

  Scenario: Successfully receive valid attributes of the user verified against SCRA with the Direct API
    * I send a POST request with "valid" attributes to ARCS staging
    * I verify the user's "valid" military attributes is received

  Scenario: Successfully receive missing attributes of the user verified against SCRA with the Direct API
    * I send a POST request with "missing" attributes to ARCS staging
    * I verify the user's "invalid" military attributes is received

  Scenario: Successfully receive invalid attributes of the user verified against SCRA with the Direct API
    * I send a POST request with "invalid" attributes to ARCS staging
    * I verify the user's "invalid" military attributes is received

  Scenario: Successfully POST valid attributes to ARCS staging
    * I send a POST request with "valid" attributes to ARCS staging
    * I verify that I authenticated with "valid" attributes

  Scenario: Successfully POST missing attributes to ARCS staging
    * I send a POST request with "missing" attributes to ARCS staging
    * I verify that I authenticated with "invalid" attributes

  Scenario: Successfully POST invalid attributes to ARCS staging
    * I send a POST request with "invalid" attributes to ARCS staging
    * I verify that I authenticated with "invalid" attributes
