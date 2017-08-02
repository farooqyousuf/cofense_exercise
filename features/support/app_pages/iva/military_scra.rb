require_relative '../base_classes/error_messages.rb'

class MilitarySCRA < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def verify(affiliation:, populate: true, type: nil)
    populate_affiliation(affiliation)

    case affiliation
    when "Service Member"        then data_set = :scra_service_member
    when "Veteran"               then data_set = :scra_veteran
    when "Retiree"               then data_set = :scra_veteran
    when "Military Spouse"       then data_set = :scra_mil_spouse
    when "Military Family"       then data_set = :scra_mil_family
    when "Military Supporter"    then data_set = :scra_mil_spouse
    when "Military Multi Family" then data_set = :scra_multi_family
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

      if ["Military Spouse", "Military Family", "Military Multi Family"].include?(affiliation)
        %w(verification_first_name verification_last_name verification_birth_date).each do |field|
          2.times {fill_in field, :with => data_for(data_set).fetch(field)}
        end
        populate_affiliation_2("Service Member")
      end
    end

    sleep 1
    click_continue
  end

  def populate_fields(data:)
    %w(verification_service_member_first_name verification_service_member_last_name verification_social verification_social_confirm).each do |field|
      fill_in field, :with => data.fetch(field)
    end

    2.times {fill_in "verification_service_member_birth_date", :with => data.fetch("verification_service_member_birth_date")}

    if ["Veteran", "Spouse", "Family"].include?(data["affiliation"])
      2.times {fill_in "verification_service_date", :with => data.fetch("verification_service_date")}
    end
  end

  def populate_affiliation(value)
    if value == "Military Multi Family"
      value = "Military Family"
    end
    select_option('#s2id_verification_subgroup_id', value)
  end

  def populate_affiliation_2(value)
    select_option("#s2id_verification_service_subgroup_id", value)
  end

  def container_attribute
    'service-record'
  end

  def required_fields
    [0,1,2,3,4]
  end

  def scra_service_member_user_and_verif_properties
    [2, 2, 2, 2, 2, 2, 2, 2]
  end

  def scra_vet_user_and_verif_properties
    [2, 2, 2, 2, 2, 2, 2, 2, 2]
  end

  def scra_mil_family_user_and_verif_properties
    [1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2]
  end

  def click_verify_scra_link
    click_link("Verify using a government service record")
  end

end
