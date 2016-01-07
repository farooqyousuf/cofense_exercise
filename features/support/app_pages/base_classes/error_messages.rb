module ErrorMessages

  def error_on(field)
  	#convert this to Capybara
  	all('.error')[field.to_i]['class'] == "error"
    #content_element.label_element(:for => field.to_s).attribute("class") == "error"
  end

end