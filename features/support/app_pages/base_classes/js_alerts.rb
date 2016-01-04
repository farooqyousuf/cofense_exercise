module JavascriptAlerts

	def js_accept
		page.driver.browser.switch_to.alert.accept
	end

end