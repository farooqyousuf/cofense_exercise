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
    when "Government"
      expand_verification_properties
      indexes = [0, 3, 6, 9, 12, 15, 18, 21]
      expected_levels = IVAGovernment.new.govt_user_and_verif_properties

    when "DD214 Vet via document"
      expand_verification_properties
      indexes = [0, 3, 6, 9, 12, 15, 18, 21, 24]
      expected_levels = DD214.new.dd214_vet_doc_user_and_verif_properties

    when "DD214 Vet via SCRA"
      expand_verification_properties
      indexes = [0, 3, 6, 9, 12, 15, 18, 21, 24]
      expected_levels = DD214.new.dd214_vet_scra_user_and_verif_properties

    when "DD214 Next of Kin Deceased Vet", "DD214 Legal Guardian"
      expand_verification_properties
      indexes = [0, 3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33]
      expected_levels = DD214.new.dd214_family_user_and_verif_properties

    when "Mil Doc Service Member", "Mil Doc Veteran", "Mil Doc Retiree"
      indexes = [0, 3, 6, 9, 12, 15, 18, 21, 24]
      expected_levels = MilitaryDoc.new.mil_doc_service_member_user_property_levels

    when "Mil Doc Mil Spouse", "Mil Doc Mil Family"
      expand_verification_properties
      indexes = [0, 3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33]
      expected_levels = MilitaryDoc.new.mil_doc_mil_family_user_and_verif_properties

    when "Mil Email Service Member"
      expand_verification_properties
      indexes = [0, 3, 6, 9]
      expected_levels = MilitaryEmail.new.mil_email_service_member_user_and_verif_properties

    when "Mil Email Mil Family"
      expand_verification_properties
      indexes = [0, 3, 6, 9, 12, 15, 18, 21]
      expected_levels = MilitaryEmail.new.mil_email_mil_family_user_and_verif_properties

    when "SCRA Service Member"
      expand_verification_properties
      indexes = [0, 3, 6, 9, 12, 15, 18, 21]
      expected_levels = MilitarySCRA.new.scra_service_member_user_and_verif_properties

    when "SCRA Veteran", "SCRA Retiree"
      expand_verification_properties
      indexes = [0, 3, 6, 9, 12, 15, 18, 21, 24]
      expected_levels = MilitarySCRA.new.scra_vet_user_and_verif_properties

    when "SCRA Mil Spouse", "SCRA Mil Family"
      expand_verification_properties
      indexes = [0, 3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33]
      expected_levels = MilitarySCRA.new.scra_mil_family_user_and_verif_properties

    when "Teacher Doc Upload"
      expand_verification_properties
      indexes = [0, 3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, 36, 39]
      expected_levels = TeacherDoc.new.teacher_doc_user_and_verif_properties

    when "Teacher State Lookup - No License/No SSN"
      expand_verification_properties
      indexes =[0, 3, 6, 9, 12, 15, 18]
      expected_levels = TeacherLookup.new.no_license_no_ssn_properties

    when "Teacher State Lookup - No License/Short SSN"
      expand_verification_properties
      indexes =[0, 3, 6, 9, 12, 15, 18, 21]
      expected_levels = TeacherLookup.new.ssn_no_license_properties

    when "Teacher State Lookup - License/No SSN"
      expand_verification_properties
      indexes = [0, 3, 6, 9, 12, 15, 18, 21]
      expected_levels = TeacherLookup.new.license_and_no_ssn_properties

    when "Teacher State Lookup - License/Short SSN"
      expand_verification_properties
      indexes = [0, 3, 6, 9, 12, 15, 18, 21]
      expected_levels = TeacherLookup.new.license_and_ssn_properties

    when "Student Credentials"
      expand_verification_properties
      indexes = [0, 3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, 36, 39, 42, 45, 48, 51, 54]
      expected_levels = StudentCreds.new.student_cred_properties

    when "Student Doc Upload"
      expand_verification_properties
      indexes = [0, 3, 6, 9, 12, 15, 18, 21, 24, 27]
      expected_levels = StudentDoc.new.student_doc_properties

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
