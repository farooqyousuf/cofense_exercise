@partners @version2 @desktop @campsaver
Feature: Test the ID.me Camp Saver Partner Integration

Background: 
	* CAMP- I check the Camp Saver ID.me Verify Instruction Page
	* CAMP- I click Shop now and verify redirect to camp saver partner
	* CAMP- I visit the product page
	* CAMP- I add product to the cart and checkout

Scenario: Test Military Integration
	* CAMP- I apply the Troop ID discount
	* CAMP- I verify the IDme discount has been applied 

Scenario: Test First Responder Integration
	* CAMP- I apply the Responder ID discount
	* CAMP- I verify the IDme discount has been applied

Scenario: Test Student Integration
	* CAMP- I apply the Student ID discount
	* CAMP- I verify the IDme discount has been applied 