Feature: Test Direct API

  Scenario: Successful Client Credential POST request sent to ARCS staging
    * I send a POST request with "valid Client Credential" attributes to ARCS staging
    * I verify that I authenticated with "valid Client Credential" attributes

  Scenario: Successful Client Credential error response for missing attributes
    * I send a POST request with "missing Client Credential" attributes to ARCS staging
    * I verify that I authenticated with "missing Client Credential" attributes
