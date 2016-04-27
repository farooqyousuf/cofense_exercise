class IVASuccess < IDmeBase

  include IVABase
  include Capybara::DSL

  def continue
    click_link("Continue")
  end

end
