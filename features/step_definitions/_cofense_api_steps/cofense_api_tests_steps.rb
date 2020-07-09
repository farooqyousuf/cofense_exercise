Given("I send a GET single user request to a dummy API site") do

	@response = HTTParty.get("https://jsonplaceholder.typicode.com/users/1")
	puts "This is the API URL endpoint that is being tested: https://jsonplaceholder.typicode.com/users/1"

	if @response.message == "OK"
		puts "The GET request was successful!"
	else
		puts "The GET request was not successful!"
	end

	puts "This is the response message: #{@response.message}"

end

Given("I send a GET all users request to a dummy API site") do

	@response = HTTParty.get("https://jsonplaceholder.typicode.com/users/")
	puts "This is the API URL endpoint that is being tested: https://jsonplaceholder.typicode.com/users/"

end


Given("I verify a GET request returns a successful response code") do
	expect(@response.code).to eq(200)             # verifies HTTP status code
	puts "This is the response code: #{@response.code}" #displays response code to console
end


Given("I verify all the users in a GET users request has an id") do

	counter = 0
	@responses = @response.to_a #convert response to an array

	@responses.each { |response| #loops through all the responses to check for user ids for each user
		counter += 1
		expect(response.key?("id")).to eq(true) #checks if 'id' key exists in the response hash
		expect(response["id"].is_a? Integer).to eq(true) #checks if 'id' key has a integer value
		puts "User #{counter}'s ID: #{response["id"]}"  #displays current user's id to console
		puts "User #{counter}'s Name: #{response["name"]}" #displays current user's name to console
		puts "User #{counter}'s Email: #{response["email"]}" #displays current user's email to console
		puts ""
	}	

end

Given("I send a DELETE request to the users endpoint") do
	@response = HTTParty.delete("https://jsonplaceholder.typicode.com/users/")
	puts "This is the API URL endpoint that is being tested: https://jsonplaceholder.typicode.com/users/"
end

Given("I verify the DELETE request returns a unsuccessful response code") do
	expect(@response.code).to eq(404)             # verifies HTTP status code
	puts "This is the response code: #{@response.code}" #displays response code to console
end
