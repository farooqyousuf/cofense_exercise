require_relative '../base_classes/error_messages.rb'

class ConfirmPhone < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def data_code
    find(".form-content strong")[:'data-code']
  end

  def confirm_phone
    click_continue
    fill_in "code", :with => data_code
    click_continue
  end

end
