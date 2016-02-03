Given(/^I should be on the government verification screen$/) do
  @iva_govt = IVAGovernment.new
  find(@iva_govt.header_css).visible?
end

Given(/^I submit the government verification form$/) do
  @iva_govt.verify
end

Given(/^I submit the empty government form$/) do
  @iva_govt = IVAGovernment.new
  @iva_govt.verify(false)
end

