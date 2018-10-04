require_relative '../base_classes/error_messages.rb'

class MilitaryVFW < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def apply_vfw_num(populate: true, type: nil)

    case type
    when "valid"
      vfw_num = rand(10 ** 10)
      confirm_vfw_num = vfw_num
    when "duplicate"
      vfw_num = "8667754363"
      confirm_vfw_num = vfw_num
    end


    fill_in_membership_num(vfw_num)
    fill_in_confirmation_membership_num(confirm_vfw_num)

    click_on("Continue")
  end

  def fill_in_membership_num(num)
    fill_in "verification[vfw_number]", :with => num
  end

  def fill_in_confirmation_membership_num(num)
    fill_in "verification[vfw_number_confirmation]", :with => num
  end
end
