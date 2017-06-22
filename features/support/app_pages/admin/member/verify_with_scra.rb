require_relative '../../base_classes/error_messages.rb'

class VerifyWithScra < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def initialize
    super("#{FigNewton.admin.user_quick_search}")
  end

  def verify_via_scra(username, affiliation:, populate: true, type: nil)
    case affiliation
    when "Service Member"   then data_set = :scra_veteran
    when "Veteran"          then data_set = :scra_veteran
    when "Retiree"          then data_set = :scra_veteran
    when "Military Spouse"  then data_set = :scra_mil_spouse
    when "Military Family"  then data_set = :scra_mil_family
    else puts "Affiliation not found"
    end

    data = data_for(data_set)

    search_for_user(username)
    select affiliation

    if populate

      populate_form_fields(data: data)
      if["Military Spouse", "Military Family"].include?(affiliation)
        2.times {
          fill_in "scra_request_first_name", :with => data.fetch("first_name")
          fill_in "scra_request_last_name", :with => data.fetch("last_name")
          fill_in "scra_request_birth_date", :with => data.fetch("service_member_birth_date")
          fill_in "scra_request_service_date", :with => data.fetch("service_date")
        }
      end
    end

    click_button("Submit")
  end

  def verify_scra_applied(username, affiliation:)
    sleep 1
    all('tr')[1].all('a')[0].click
    sleep 2
    page.assert_text username
  end

  def search_for_user(username)
    populate_search_field(search_box: username)
    click_button("Search")
    click_link("capybara+")
    click_link("Verify with SCRA")
  end

  def populate_search_field(search_box:)
    fill_in("query", :with => search_box)
  end

  def populate_form_fields(data:)
    fill_in "scra_request_service_member_first_name", :with => data.fetch("service_member_first_name")
    fill_in "scra_request_service_member_last_name", :with => data.fetch("service_member_last_name")
    fill_in "scra_request_service_member_birth_date", :with => data.fetch("service_member_birth_date")
    fill_in "scra_request_social", :with => data.fetch("social")
    fill_in "scra_request_service_date", :with => data.fetch("service_date")
  end

  def check_admin_scra_form_error(fields, affiliation:)
    check_admin_scra_form_error_messages(fields, affiliation: affiliation)
    check_admin_scra_form_red_highlighted_errors(fields, affiliation: affiliation)
  end

  def check_admin_scra_form_error_messages(fields, affiliation:)
    form_error_messages_count = all(".formError").count
    form_error_messages_count.should == fields.count
  end

  def check_admin_scra_form_red_highlighted_errors(fields, affiliation:)
    admin_red = "rgba(185, 74, 72, 1)"

    fields.each do |field|
      %w(top right bottom left).each do |border_side|
        red_highlighted_field = page.find("#scra_request_#{field}").native.css_value("border-#{border_side}-color")
        red_highlighted_field.should == admin_red
      end
    end
  end
end
