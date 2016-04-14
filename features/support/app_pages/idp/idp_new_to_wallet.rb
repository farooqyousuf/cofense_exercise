class IDPNewWallet < IDmeBase

  include IDPBase

  def click_joining_first_time
    click_link("I am joining ID.me for the first time")
  end

  def check_tos_pp
    first(".field.checkbox").native.find_element(:id, "user_accepts_terms").click
  end

end
