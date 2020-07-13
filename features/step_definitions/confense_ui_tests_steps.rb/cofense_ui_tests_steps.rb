Given("I visit the UltimateQA website") do
	#visits the UltimateQA website
	$driver.get FigNewton.ultimate_qa_site.url																								
end


Given("I select the Other radio button in the Radio Buttons section and output the state to console") do
	$driver.find_element(:css,"[name='gender'][value='other']").click																		#Selects 'Other' radio button
	puts "This is the value of the the radio button: #{$driver.find_element(:css,"[name='gender'][value='other']").attribute("value")}"		#Outputs the selected 'other' value to console
end


Given("I select Audi in the Dropdown section and output the value to console") do
	element= $driver.find_element(:tag_name,"select")
	select=Selenium::WebDriver::Support::Select.new(element)
	select.select_by(:text, "Audi") 																										#Selects 'Audi' from the dropdown
	puts "This is the value of the dropdown selection: #{$driver.find_element(:tag_name, 'select').attribute("value")}"						#Outputs the selected 'Audi' value to console
end


Given("I traverse the Table with unique ID in the Table section and output the Title and Salary to console") do
	#This outputs the title and salary of the 3 entries in the table. I wanted to use string interpolation and create a loop
	#to make this more DRY (do not repeat yourself), but for some reason the interpolation wasn't working in this case.
	#Instead of spinning my wheels I left it as is and in real world scenario, I'd probably re-visit to DRY it up
	#and make it more efficient/clean.
	
	puts "First Title: #{$driver.find_element(css: '#htmlTableId tbody tr:nth-of-type(2) td:nth-of-type(1)').text}"
	puts "First Salary: #{$driver.find_element(css: '#htmlTableId tbody tr:nth-of-type(2) td:nth-of-type(3)').text}"
	puts "**************************"
	puts "Second Title: #{$driver.find_element(css: '#htmlTableId tbody tr:nth-of-type(3) td:nth-of-type(1)').text}"
	puts "Second Salary: #{$driver.find_element(css: '#htmlTableId tbody tr:nth-of-type(3) td:nth-of-type(3)').text}"
	puts "**************************"
	puts "Third Title: #{$driver.find_element(css: '#htmlTableId tbody tr:nth-of-type(4) td:nth-of-type(1)').text}"
	puts "Third Salary: #{$driver.find_element(css: '#htmlTableId tbody tr:nth-of-type(4) td:nth-of-type(3)').text}"
end