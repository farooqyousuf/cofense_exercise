Given("I verify that the user was searched with {string} using the Support tool") do |type|
  @SupportTool.login_in_new_window
  @SupportTool.verify_search(type: type)
end
