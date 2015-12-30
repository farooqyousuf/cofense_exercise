class IVAGovernment < IVABase

  include Capybara::DSL

  def header_css
    ".form-title"
  end

  def verify(populate = true)
  	if populate
  		data = data_for(:government)
  		populate_fields(data)
    end

    click_verify_button
  end

  def click_verify_button
    click_button("Verify now")
  end

  def populate_fields(data)
  	fill_in("first_name", :with => data.fetch("first_name"))
  	fill_in("last_name", :with => data.fetch("last_name"))
    fill_in("city", :with => data.fetch("city"))
    fill_in("county", :with => data.fetch("county"))
    unique_email
    2.times { fill_in("birth_date", :with => data.fetch("dob")) }
  	populate_state(data.fetch("state"))
    populate_affiliation(data.fetch("affiliation"))
    populate_agency(data.fetch("agency"))
  end

  def unique_email
    @email = "capybara+"+"#{rand(6 ** 8)}"+"@id.me"
    fill_in("email", :with => @email)
    fill_in("email_confirmation", :with => @email)
  end

  # def verification_code
  #   fill_in("verification_code", :with => )
  # end

  def container_attribute
    'government-email'
  end

  def populate_affiliation(value)
    select_option(container_attribute, ".government-affiliation", value)
  end

  def populate_agency(value)
    search_option(container_attribute, ".government-agency", value)
  end

  def populate_state(value)
    select_option(container_attribute, ".state-select", value)
  end

end