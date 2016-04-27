require_relative '../base_classes/error_messages.rb'

class LOAInfo < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def verify(populate = true, level)
    if populate
      data = data_for(:experian_user2)
      populate_base_loa_info(data)

      if level == "LOA3"
        fill_in "card", :with => data.fetch("credit_card")
      end

    end
    click_button("Verify")
  end

  def populate_base_loa_info(data)
    populate_fields(data)
    populate_state(data)
    accept_fcra_terms
  end

  def populate_fields(data)
    %w(fname lname social social_confirm street city).each do |field|
      fill_in field, :with => data.fetch(field)
    end

    %w(birth_date phone zip).each do |field|
      2.times {fill_in field, :with => data.fetch(field)}
    end
  end

  def populate_state(data)
    select_filter2("#s2id_state", data.fetch("state"))
  end

  def accept_fcra_terms
    #for some reason the first time it doesn't work sometimes
    3.times {first(".checkbox").native.find_element(:id, "accepts_fcra").click}
  end

  def phone_field
    "#phone"
  end

  def page_title
    "Verify with ID.me"
  end

  def credit_card
    "#card"
  end

end
