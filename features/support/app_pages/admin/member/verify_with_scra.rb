require_relative '../../base_classes/base_idp.rb'

class VerifyWithScra < IDmeBase

  include Capybara::DSL
  include IDPBase
  include DataMagic

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
    data_denied = data_for(:scra_denied_data)

    if populate


      search_for_user(username)

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
          fill_in "scra_request_birth_date", :with => data.fetch("verification_service_member_birth_date")
          fill_in "scra_request_service_date", :with => data.fetch("verification_service_date")
        }
      end
      click_button("Submit")
    end
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
    fill_in "scra_request_service_member_first_name", :with => data.fetch("verification_service_member_first_name")
    fill_in "scra_request_service_member_last_name", :with => data.fetch("verification_service_member_last_name")
    fill_in "scra_request_service_member_birth_date", :with => data.fetch("verification_service_member_birth_date")
    fill_in "scra_request_social", :with => data.fetch("verification_social")
    fill_in "scra_request_service_date", :with => data.fetch("verification_service_date")
  end
end
