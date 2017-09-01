Feature: Test Direct API

  Scenario: Successfully receive valid attributes of the user verified against SCRA with the Direct API
    * I used valid client credentials
    * I used "valid" user attributes
    * I send a POST request to ARCS
    * I verify the user's "valid" military attributes is received

  Scenario: Successfully receive invalid attributes of the user verified against SCRA with the Direct API
    * I used valid client credentials
    * I used "invalid" user attributes
    * I send a POST request to ARCS
    * I verify the user's "invalid" military attributes is received

  Scenario: Successfully receive missing attributes of the user verified against SCRA with the Direct API
    * I used valid client credentials
    * I used "missing" user attributes
    * I send a POST request to ARCS
    * I verify the user's "missing" military attributes is received

  Scenario: Successfully POST valid attributes to ARCS staging
    * I used valid client credentials
    * I used "valid" user attributes
    * I send a POST request to ARCS
    * I verify that I authenticated with "valid" attributes

  Scenario: Successfully POST invalid attributes to ARCS staging
    * I used valid client credentials
    * I used "invalid" user attributes
    * I send a POST request to ARCS
    * I verify that I authenticated with "invalid" attributes

  Scenario: Successfully POST missing attributes to ARCS staging
    * I used valid client credentials
    * I used "missing" user attributes
    * I send a POST request to ARCS
    * I verify that I authenticated with "missing" attributes
