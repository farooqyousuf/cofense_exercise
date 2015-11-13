class OAuthTester < SitePrism::Page
	set_url "https://oauth-tester-staging.idmeinc.net/"

	#OAuth Tester Main Homepage
	element :oauth_integration_button, "button[text='OAuth Integration']"
	element :direct_api_button, "link[text='Direct API']"

	#OAuth Integration
	element :organization_dropdown, "select[name='organization']"
	element :consumer_dropdown, "select[name='consumer']"
	element :policy_dropdown, "select[name='policy']"
	element :provider_dropdown, "select[name='provider']"

	element :authenticate_button, "link[name='commit']"

end