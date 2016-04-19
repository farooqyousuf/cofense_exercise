require_relative '../base_classes/error_messages.rb'

class MilitaryEmailFamily < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def required_fields
    [0, 1, 2, 4, 5, 6, 7, 8]
  end

end
