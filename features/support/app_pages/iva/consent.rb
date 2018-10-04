require_relative '../base_classes/error_messages.rb'

class Consent < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def allow
    click_on("Allow")
  end

end
