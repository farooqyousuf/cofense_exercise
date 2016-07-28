@partners @jrcigar @version2 @desktop
Feature: Test JR Cigar Partner Integration
	
	Scenario: Test Military integration for JR Cigar
		* JRCIGAR - I verify the military discount landing page
		* JRCIGAR - I login to JR Cigar
		* JRCIGAR - I add item to the cart
		* JRCIGAR - I verify the IDme discount checkout modal
		* JRCIGAR - I login with my military Idme account
		* JRCIGAR - I verify my IDme military discount has been applied 

	Scenario: Test First Responder integration for JR Cigar
		* JRCIGAR - I verify the military discount landing page
		* JRCIGAR - I login to JR Cigar
		* JRCIGAR - I add item to the cart
		* JRCIGAR - I verify the IDme discount checkout modal
		* JRCIGAR - I login with my First Responder Idme account
		* JRCIGAR - I verify my IDme First Responder discount has been applied 