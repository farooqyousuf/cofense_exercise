require_relative '../base_classes/error_messages.rb'

class ConfirmEmail < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def data_code
    find(".form-content strong")[:'data-code']
  end

  def confirm_email
    fill_in "code", :with => data_code
    click_submit
  end

end
