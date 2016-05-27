require_relative '../base_classes/error_messages.rb'

class DD214NonVet < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def required_fields
    [0, 1, 2, 3, 4, 5, 6, 7, 8, 13, 14, 15, 17, 18, 19]
  end


end
