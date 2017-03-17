require_relative '../../base_classes/base_idp.rb'

class VerifyWithScra < IDmeBase
  attr_accessor :username

  include Capybara::DSL
  include IDPBase
  include DataMagic

  def initialize
    super(FigNewton.admin.user_quick_search)
  end

  def verify(username, populate: true, affiliation:, type: nil)
    populate_field(search_box: username)
    click_button("Search")
    click_link("capybara+")
    click_link("Verify with SCRA")

    case affiliation
    when "Service Member"   then data_set = :dd214_via_scra
    when "Veteran"          then data_set = :dd214_via_scra
    when "Retiree"          then data_set = :dd214_via_scra
    when "Military Spouse"  then data_set = :scra_mil_spouse
    when "Military Family"  then data_set = :scra_mil_family
    else puts "Affiliation not found!"
    end

    if populate
      data = data_for(data_set)
      case type
      when "unique"
        select affiliation
      end
      populate_fields(data: data)
    end

    click_button("Submit to SCRA")
  end

  def populate_field(search_box:)
    fill_in("query", :with => search_box)
  end

  def populate_fields(data:)
    %w(service_member_first_name service_member_last_name service_member_birth_date social).each do |field|
      fill_in field, :with => data.fetch(field)
      fill_in("service_date", :with => data.fetch("date_entered"))
    end
  end

  # def populate_veteran
  #   data = data_for(:dd214_via_scra)
  #   fill_in("service_member_first_name", :with => data.fetch("service_member_first_name"))
  #   fill_in("service_member_last_name", :with => data.fetch("service_member_last_name"))
  #   fill_in("service_member_birth_date", :with => data.fetch("service_member_birth_date"))
  #   fill_in("social", :with => data.fetch("social"))
  #   fill_in("service_date", :with => data.fetch("date_entered"))
  # end

  # def verify_before (username, affiliation: "none")
  #   def select_veteran
  #     data = data_for(:dd214_via_scra)
  #     find("td", text: data.fetch("service_member_first_name") + " " + data.fetch("service_member_last_name")).click
  #   end
  #
  #   def select_mil_spouse
  #     data = data_for(:scra_mil_spouse)
  #     find("td", text: data.fetch("first_name") + " " + data.fetch("last_name")).click
  #   end
  #
  #   def select_mil_family
  #     data = data_for(:scra_mil_family)
  #     find("td", text: data.fetch("first_name") + " " + data.fetch("last_name")).click
  #   end
  #
  #   case affiliation
  #   when "Service Member"
  #     data = data_for(:dd214_via_scra)
  #     select_veteran
  #   when "Veteran"
  #     data = data_for(:dd214_via_scra)
  #     select_veteran
  #   when "Retiree"
  #     data = data_for(:dd214_via_scra)
  #     select_veteran
  #   when "Military Spouse"
  #     data = data_for(:scra_mil_spouse)
  #     select_mil_spouse
  #   when "Military Family"
  #     data = data_for(:scra_mil_family)
  #     select_mil_family
  #   end
  #   sleep 1
  #   page.assert_text username
  # end
  #

  #
  # def populate_mil_spouse
  #   data = data_for(:scra_mil_spouse)
  #   fill_in("first_name", :with => data.fetch("first_name"))
  #   fill_in("last_name", :with => data.fetch("last_name"))
  #   fill_in("birth_date", :with => data.fetch("birth_date"))
  #   fill_in("service_member_first_name", :with => data.fetch("service_member_first_name"))
  #   fill_in("service_member_last_name", :with => data.fetch("service_member_last_name"))
  #   fill_in("service_member_birth_date", :with => data.fetch("service_member_birth_date"))
  #   fill_in("social", :with => data.fetch("social"))
  #   fill_in("service_date", :with => data.fetch("service_date"))
  # end
  #
  # def populate_mil_family
  #   data = data_for(:scra_mil_family)
  #   fill_in("first_name", :with => data.fetch("first_name"))
  #   fill_in("last_name", :with => data.fetch("last_name"))
  #   fill_in("birth_date", :with => data.fetch("birth_date"))
  #   fill_in("service_member_first_name", :with => data.fetch("service_member_first_name"))
  #   fill_in("service_member_last_name", :with => data.fetch("service_member_last_name"))
  #   fill_in("service_member_birth_date", :with => data.fetch("service_member_birth_date"))
  #   fill_in("social", :with => data.fetch("social"))
  #   fill_in("service_date", :with => data.fetch("service_date"))
  # end
end
