@jockey @desktop @version2
Feature: Test the ID.me Jockey.com Partner Integration
	Background:
		* JO - I add an item to the cart

  Scenario: Test Jockey Troop ID partner Integration
    * JO - I apply the "troop_id" discount
    * JO - I verify the IDme discount has been applied

  Scenario: Test Jockey Student ID partner Integration
  	* JO - I apply the "student_id" discount
  	* JO - I verify the IDme discount has been applied

  Scenario: Test Jockey First Responder partner Integration
  	* JO - I apply the "responder_id" discount
  	* JO - I verify the IDme discount has been applied
