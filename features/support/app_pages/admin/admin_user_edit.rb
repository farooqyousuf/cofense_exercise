require_relative "../base_classes/page_mgmt"

class UserEdit < IDmeBase

include Capybara::DSL
include PageManagement

  def collect_user_properties
    @elements = all("td.center.short")
  end

  def expand_verification_properties
    page.find(".accordion-navigation").click
    collect_user_properties
  end

  def compare_expected_and_actual_levels(affiliation)

    actual_levels = []

    case affiliation
    when "Identity via phone"
      expand_verification_properties
      indexes = [0, 3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, 36, 39, 42]
      expected_levels = IDVPhone.new.user_properties_levels

    when "Identity via computer"
      expand_verification_properties
      indexes = [0, 3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, 36, 39, 42]
      expected_levels = IDVComputer.new.user_properties_levels

    when "Government"
      expand_verification_properties
      indexes = [0, 3, 6, 9, 12, 15, 18, 21]
      expected_levels = IVAGovernment.new.user_properties_levels

    when "DD214 Vet via document"
      expand_verification_properties
      indexes = [0, 3, 6, 9, 12, 15, 18, 21, 24]
      expected_levels = DD214.new.vet_doc_user_properties_levels

    when "DD214 Vet via SCRA"
      expand_verification_properties
      indexes = [0, 3, 6, 9, 12, 15, 18, 21, 24]
      expected_levels = DD214.new.vet_scra_user_properties_levels

    when "DD214 Next of Kin Deceased Vet", "DD214 Legal Guardian"
      expand_verification_properties
      indexes = [0, 3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33]
      expected_levels = DD214.new.family_user_properties_levels

    when "Mil Doc Service Member", "Mil Doc Veteran", "Mil Doc Retiree"
      indexes = [0, 3, 6, 9, 12, 15, 18, 21, 24]
      expected_levels = MilitaryDoc.new.service_member_user_properties_levels

    when "Mil Doc Mil Spouse", "Mil Doc Mil Family"
      expand_verification_properties
      indexes = [0, 3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33]
      expected_levels = MilitaryDoc.new.family_user_properties_levels

    when "Mil Email Service Member"
      expand_verification_properties
      indexes = [9, 12, 15, 18]
      expected_levels = MilitaryEmail.new.service_member_user_properties_levels

    when "Mil Email Mil Family"
      expand_verification_properties
      indexes = [9, 12, 15, 18, 21, 24, 27, 30]
      expected_levels = MilitaryEmail.new.family_user_properties_levels

    when "SCRA Service Member"
      expand_verification_properties
      indexes = [15, 18, 21, 24, 27, 30, 33, 36]
      expected_levels = MilitarySCRA.new.service_member_user_properties_levels

    when "SCRA Veteran", "SCRA Retiree"
      expand_verification_properties
      indexes = [15, 18, 21, 24, 27, 30, 33, 36, 39]
      expected_levels = MilitarySCRA.new.vet_user_properties_levels

    when "SCRA Mil Spouse", "SCRA Mil Family"
      expand_verification_properties
      indexes = [9, 12, 15, 18, 21, 24, 27, 30, 33, 36, 39, 42]
      expected_levels = MilitarySCRA.new.family_user_properties_levels

    when "Teacher Doc Upload"
      expand_verification_properties
      indexes = [0, 3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, 36, 39]
      expected_levels = TeacherDoc.new.user_properties_levels

    when "Teacher State Lookup - No License/No SSN"
      expand_verification_properties
      indexes =[0, 3, 6, 9, 12, 15, 18]
      expected_levels = TeacherLookup.new.no_license_no_ssn_user_properties_levels

    when "Teacher State Lookup - No License/Short SSN"
      expand_verification_properties
      indexes =[0, 3, 6, 9, 12, 15, 18, 21]
      expected_levels = TeacherLookup.new.ssn_no_license_user_properties_levels

    when "Teacher State Lookup - License/No SSN"
      expand_verification_properties
      indexes = [0, 3, 6, 9, 12, 15, 18, 21]
      expected_levels = TeacherLookup.new.license_and_no_ssn_user_properties_levels

    when "Teacher State Lookup - License/Short SSN"
      expand_verification_properties
      indexes = [0, 3, 6, 9, 12, 15, 18, 21]
      expected_levels = TeacherLookup.new.license_and_ssn_user_properties_levels

    when "Student Credentials"
      expand_verification_properties
      indexes = [0, 3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, 36, 39, 42, 45, 48, 51, 54]
      expected_levels = StudentCreds.new.user_properties_levels

    when "Student Doc Upload"
      expand_verification_properties
      indexes = [0, 3, 6, 9, 12, 15, 18, 21, 24, 27]
      expected_levels = StudentDoc.new.user_properties_levels

    when "EMT Doc"
      indexes = [0, 3, 6, 9, 12, 15, 18, 21, 24]
      expected_levels = DocEMT.new.user_properties_levels

    when "EMT National"
      expand_verification_properties
      indexes = [0, 3, 6, 9, 12, 15]
      expected_levels = NationalEMT.new.user_properties_levels

    when "EMT State Doc"
      indexes = [0, 3, 6, 9, 12, 15, 18, 21, 24]
      expected_levels = StateDocEMT.new.user_properties_levels

    when "EMT State Lookup"
      expand_verification_properties
      indexes = [0, 3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 36, 39]
      expected_levels = StateLookupEMT.new.user_properties_levels

    when "Firefighter Doc"
      indexes = [0, 3, 6, 9, 12, 15, 18, 21, 24]
      expected_levels = DocFirefighter.new.user_properties_levels

    when "Firefighter ProBoard"
      expand_verification_properties
      indexes = [0, 3, 6, 9, 12, 15, 18, 21]
      expected_levels = PBFirefighter.new.user_properties_levels

    when "Police"
      indexes = [0, 3, 6, 9, 12, 15, 18, 21, 24]
      expected_levels = Police.new.user_properties_levels
    end

    #builds the actual_levels array according to whichever numbers array is selected in the case statement above
    indexes.each do |i|
      actual_levels << @elements[i].text.to_i
    end

    actual_levels.should == expected_levels
    puts "Expected User Property Levels: #{expected_levels}"
    puts "Actual User Property Levels: #{actual_levels}"

  end

end
