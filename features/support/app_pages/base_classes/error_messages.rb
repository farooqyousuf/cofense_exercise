module ErrorMessages

  def error_on(field)
  	#convert this to Capybara
  	binding.pry
    content_element.label_element(:for => field.to_s).attribute("class") == "error"
  end

end