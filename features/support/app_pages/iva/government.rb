class IVAGovernment < IVABase

  def header_css
    ".form-title"
  end

  def verify(populate = true)
  	if populate
  		data = data_for(:government)

  		populate_fields(data)


  end

  def populate_fields(data)
  	fill_in("first_name", :with => data.fetch("first_name"))
  	fill_in("last_name", :with => data.fetch("last_name"))
  	fill_in("birth_date", :with => data.fetch("birth_date"))
  	select_option(container_attribute, ".government-affiliation", data.fetch("affiliation"))
  end


  def container_attribute
    content_element.attribute("data-option")
  end


end