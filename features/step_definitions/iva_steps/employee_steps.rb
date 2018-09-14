Given("I create a Employee page object") do
  @IVAEmployee = IVAEmployee.new
end

Given("I submit the employee verification form as a {string} record") do |type|
  @IVAEmployee.verify(email_type: type)
end

Given("I submit the empty employee form") do
  @IVAEmployee.verify(populate: false)
end
