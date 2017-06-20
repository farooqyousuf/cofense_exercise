require_relative '../base_classes/error_messages.rb'

class VerificationSuccess < IDmeBase
  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def click_continue
    click_link "Continue"
  end
end
