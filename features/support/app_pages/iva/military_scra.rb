require_relative '../base_classes/error_messages.rb'

class MilitarySCRA < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def verify(affiliation:, populate: true, type: nil)
    find("[data-option='service-record']").find(".verification-header").click
    populate_affiliation(affiliation)

    case affiliation
    when "Service Member"     then data_set = :scra_service_member
    when "Veteran"            then data_set = :scra_veteran
    when "Retiree"            then data_set = :scra_mil_spouse
    when "Military Spouse"    then data_set = :scra_mil_spouse
    when "Military Family"    then data_set = :scra_mil_family
    when "Military Supporter" then data_set = :scra_mil_spouse
    else puts "Affiliation not found!"
    end

    if populate

      data = data_for(data_set) #info for unique user
      data_denied = data_for(:scra_denied_data) #info for denied user

      case type
      when "unique"
        populate_fields(data: data)
      when "denied"
        populate_fields(data: data_denied)
      end

      if ["Military Spouse", "Military Family"].include?(affiliation)
        %w(first_name last_name birth_date).each do |field|
          2.times {fill_in field, :with => data_for(data_set).fetch(field)}
        end
        populate_affiliation_2("Service Member")
      end

    end

    click_verify_button
  end

  def populate_fields(data:)
    %w(service_member_first_name service_member_last_name social social_confirm).each do |field|
      fill_in field, :with => data.fetch(field)
    end

    %w(service_member_birth_date service_date).each do |field|
      2.times {fill_in field, :with => data.fetch(field)}
    end
  end

  def populate_affiliation(value)
    select_option(container_attribute, ".military-affiliation", value, index=0)
  end

  def populate_affiliation_2(value)
    select_option(container_attribute, ".service-affiliation", value, index=0)
  end

  def container_attribute
    'service-record'
  end

  def required_fields
    [0,1,2,3,4,5,6]
  end

end
