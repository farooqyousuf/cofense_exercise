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
  		binding.pry
  	end
  end

  def populate_fields(data)
  	%w(fname lname birth_date social social_confirm phone street city zip).each do |field|
  		fill_in field, :with => data.fetch(field)
  	end
  end

  def populate_state(data)
  	select_filter2("s2id_state", data.fetch("state"))
  end

end