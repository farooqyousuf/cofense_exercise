Given(/^I should see the red alert box error message "(.*?)"$/) do |expected_text|
  (red_alert_box_message.should eq(expected_text)).should == true
end

Given(/^I should see the green alert box error message "(.*?)"$/) do |expected_text|
  (green_alert_box_message.should eq(expected_text)).should == true
end

Given(/^I should see an error on the "(.*)" field$/) do |expected_text|
  sleep 1
  expect(all(error_label_css).map(&:text)).to include(expected_text)
end
  
Given(/^I should see error messages on required fields for "([^"]*)"$/) do |method|
  var = case method
  		  when "Government"		    then IVAGovernment
        when "DD214 Vet"        then DD214
        when "DD214 Non-Vet"    then DD214NonVet
  		  else fail("Verification option not found")
  	    end

    page = (var).new
	  page.required_fields.each do |field|
	  expect(page.error_on(field)).to be_truthy
	end

end