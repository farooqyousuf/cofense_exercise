@api
Feature: Automating three API calls to a dummy API site and returning specific values

  Scenario: Verify a GET users request returns a 200 response code (print response code to console)
    * I send a GET single user request to a dummy API site
    * I verify a GET request returns a successful response code

  Scenario: Verify each user in a GET users request has an id (print validation to console)
  	* I send a GET all users request to a dummy API site
  	* I verify all the users in a GET users request has an id

  Scenario: Verify a DELETE request on any of the main endpoints returns a 404 response code (print response code to console)
  	* I send a DELETE request to the users endpoint
  	* I verify the DELETE request returns a unsuccessful response code