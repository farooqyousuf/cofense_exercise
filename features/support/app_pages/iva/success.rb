class IVASuccess < IDmeBase

  include IVABase
  include Capybara::DSL

  def click_here_to_finish
    click_link("Click here to finish")
  end

end