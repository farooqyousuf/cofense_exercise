Feature: Test Direct API

  Scenario: Successful Client Credential POST request sent to ARCS staging
    * I send a POST request with valid Client Credential attributes to ARCS staging
    * I verify that the response is valid
