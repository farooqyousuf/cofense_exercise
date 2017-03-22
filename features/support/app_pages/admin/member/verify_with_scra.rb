require_relative '../../base_classes/base_idp.rb'

class VerifyWithScra < IDmeBase

  include Capybara::DSL
  include IDPBase
  include DataMagic

  def initialize
    super("#{FigNewton.admin.user_quick_search}")
  end

  def scra_verify(username, affiliation:, populate: true, type: nil)
    case affiliation
    when "Service Member"   then data_set = :dd214_via_scra
    when "Veteran"          then data_set = :dd214_via_scra
    when "Retiree"          then data_set = :dd214_via_scra
    when "Military Spouse"  then data_set = :scra_mil_spouse
    when "Military Family"  then data_set = :scra_mil_family
    else puts "Affiliation not found"
    end

    data = data_for(data_set)

    if populate
      populate_search_field(search_box: username)
      click_button("Search")
      click_link("capybara+")
      click_link("Verify with SCRA")
      select affiliation
      populate_form_fields(data: data)
      if["Military Spouse", "Military Family"].include?(affiliation)
        %w(first_name last_name birth_date).each do |field|
          2.times {fill_in field, :with => data_for(data_set).fetch(field)}
          fill_in("service_date", :with => data.fetch("service_date"))
        end
      else
        fill_in("service_date", :with => data.fetch("date_entered"))
      end
      click_button("Submit to SCRA")
    end
  end

  def verify(username, affiliation:)
    sleep 1
    case affiliation
    when "Service Member"
      data = data_for(:dd214_via_scra)
      find("td", text: data.fetch("service_member_first_name") + " " + data.fetch("service_member_last_name")).click
    when "Veteran"
      data = data_for(:dd214_via_scra)
      find("td", text: data.fetch("service_member_first_name") + " " + data.fetch("service_member_last_name")).click
    when "Retiree"
      data = data_for(:dd214_via_scra)
      find("td", text: data.fetch("service_member_first_name") + " " + data.fetch("service_member_last_name")).click
    when "Military Spouse"
      data = data_for(:scra_mil_spouse)
      find("td", text: data.fetch("first_name") + " " + data.fetch("last_name")).click
    when "Military Family"
      data = data_for(:scra_mil_family)
      all("a", text: data.fetch("first_name") + " " + data.fetch("last_name"))[1].click
    end

    sleep 2
    page.assert_text username
  end

  def populate_search_field(search_box:)
    fill_in("query", :with => search_box)
  end

  def populate_form_fields(data:)
    %w(service_member_first_name service_member_last_name service_member_birth_date social).each do |field|
      fill_in field, :with => data.fetch(field)
    end
  end
end
