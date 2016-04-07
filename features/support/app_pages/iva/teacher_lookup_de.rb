require_relative '../base_classes/error_messages.rb'

class TeacherLookupDE < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def required_fields
    [0,1,2,3,4,5]
  end


end

