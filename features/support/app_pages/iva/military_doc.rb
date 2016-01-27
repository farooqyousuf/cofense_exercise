require_relative '../base_classes/error_messages.rb'

class MilitaryDoc < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def verify(affiliation, populate = true)
  	find("[data-option=#{container_attribute}]").find(".verification-header").click

  	populate_affiliation(affiliation)

  	if populate
  		populate_fields(data_for(:military_doc))
  	end

  	click_verify_button
  end

  def populate_fields(data)
  	fill_in "service_member_first_name", with: data.fetch("first_name")
	fill_in "service_member_last_name", with: data.fetch("last_name")
	2.times { fill_in "birth_date", with: data.fetch("dob") }
	fill_in "social", with: data.fetch("ssn")
	fill_in "social_confirm", with: data.fetch("ssn")
	fill_in "street", with: data.fetch("street")
	fill_in "city", with: data.fetch("city")
	2.times { fill_in "zip", with: data.fetch("zip") }
	populate_state("Kansas")
	click_verify_button

	populate_dd214_type("DD214 - Other")
	resize_window_for_unique_doc
	save_screenshot
	attach_dd214_file
  end

  def container_attribute
  	"military-document"
  end

  def populate_affiliation(value)
	select_option(container_attribute, ".military-affiliation", value)
  end 

  def populate_state(value)
  	select_option(container_attribute, "#s2id_state", value)
  end

  def populate_dd214_type(value)
  	wait_for_ajax
  	select_option(container_attribute, "#s2id_document_type_id", value)
  end

  def resize_window_for_unique_doc
  	x.to_i = "1 + #{random.to_s[2..4]}"
  	y.to_i = "1 + #{random.to_s[2..4]}"
  	page.driver.browser.manage.window.resieze_to(x,y)
  end

  def attach_dd214_file
  	page.driver.browser.all(:xpath, '//input[@type="file"]')[0].send_keys("#{Dir.pwd}/screenshots/screenshot2.png")
  end

end