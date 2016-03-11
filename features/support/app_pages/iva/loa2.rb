require_relative '../base_classes/error_messages.rb'

class LOA2 < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def verify(populate = true)
  	if populate 
  		data = data_for(:experian_user2)
  		populate_fields(data)
  		populate_state(data)
  		accept_fcra_terms
  	end
    click_button("Verify") 
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
    find("#accepts_fcra", :visible => false).click
  end

end