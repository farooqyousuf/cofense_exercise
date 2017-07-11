require_relative '../../base_classes/error_messages.rb'

class VerifyWithScra < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def initialize
    super("#{FigNewton.admin.user_quick_search}")
  end

  def verify_via_scra(user_email, affiliation:, populate: true, type: nil)
    case affiliation
    when "Service Member"   then data_set = :scra_veteran
    when "Veteran"          then data_set = :scra_veteran
    when "Retiree"          then data_set = :scra_veteran
    when "Military Spouse"  then data_set = :scra_mil_spouse
    when "Military Family"  then data_set = :scra_mil_family
    else puts "Affiliation not found"
    end

    data = data_for(data_set)
    data_denied = data_for(:scra_denied_data)

    search_for_user(user_email)
    select affiliation

    if populate

      case type
      when "unique"
        select affiliation
        populate_form_fields(data: data)
      when "denied"
        select "Service Member"
        populate_form_fields(data: data_denied)
      end

      if["Military Spouse", "Military Family"].include?(affiliation)
        2.times {
          fill_in "scra_request_first_name", :with => data.fetch("verification_first_name")
          fill_in "scra_request_last_name", :with => data.fetch("verification_last_name")
          fill_in "scra_request_service_date", :with => data.fetch("verification_service_date")
        }
        2.times {fill_in "scra_request_birth_date", :with => data.fetch("verification_service_member_birth_date")}
      end
    end
    click_button("Submit")
  end

  def verify_scra_applied(user_email, affiliation:)
    sleep 1
    all('tr')[1].all('a')[0].click
    sleep 2
    page.assert_text user_email
  end

  def search_for_user(user_email)
    populate_search_field(search_box: user_email)
    click_button("Search")
    click_link("capybara+")
    click_link("Verify with SCRA")
  end

  def populate_search_field(search_box:)
    fill_in("query", :with => search_box)
  end

  def populate_form_fields(data:)
    fill_in "scra_request_service_member_first_name", :with => data.fetch("verification_service_member_first_name")
    fill_in "scra_request_service_member_last_name", :with => data.fetch("verification_service_member_last_name")
    2.times {fill_in "scra_request_service_member_birth_date", :with => data.fetch("verification_service_member_birth_date")}
    2.times {fill_in "scra_request_social", :with => data.fetch("verification_social")}
    fill_in "scra_request_service_date", :with => data.fetch("verification_service_date")
  end

  def verify_denied_scra_error_message
    page.assert_selector ".alert"
  end

  def verify_admin_scra_form_error_messages(affiliation:)
    form_field = %w[service_member_first_name service_member_last_name service_member_birth_date social service_date]
    form_field_family = %w[first_name last_name birth_date]

    fields = case affiliation
             when "Service Member", "Veteran", "Retiree"    then form_field
             when "Military Family", "Military Spouse"      then form_field.push(*form_field_family)
             else fail("Affiliation not found")
             end

   form_error_messages_count.should == fields.count
  end

  def verify_admin_scra_form_red_highlighted_errors(affiliation:)
    form_field = %w[service_member_first_name service_member_last_name service_member_birth_date social service_date]
    form_field_family = %w[first_name last_name birth_date]

    fields = case affiliation
             when "Service Member", "Veteran", "Retiree"    then form_field
             when "Military Family", "Military Spouse"      then form_field.push(*form_field_family)
             else fail("Affiliation not found")
             end

    fields.each do |field|
      %w(top right bottom left).each do |border_side|
        red_highlighted_field = page.find("#scra_request_#{field}").native.css_value("border-#{border_side}-color")
        red_highlighted_field.should == admin_red
      end
    end
  end

  def form_error_messages_count
    all(".formError").count
  end

  def admin_red
    "rgba(185, 74, 72, 1)"
  end
end
