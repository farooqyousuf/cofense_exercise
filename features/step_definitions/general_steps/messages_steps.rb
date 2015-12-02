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