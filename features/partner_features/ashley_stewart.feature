@partners @version2 @desktop @ashley_stewart
Feature: Test Ashley Stewart Partner Integration
	Background:
		* ASHLEY- I visit the shop page
		* ASHLEY- I add a item to the cart
		* ASHLEY- I visit the checkout page

	Scenario: Test Ashley Stewart Military Integration
		* ASHLEY- I sign in with my Id.me military account
		* ASHLEY- I verify my military discount was applied

	Scenario: Test Ashley Stewart Teacher Integration
		* ASHLEY- I sign in with my Id.me teacher account
		* ASHLEY- I verify my teacher discount was applied
