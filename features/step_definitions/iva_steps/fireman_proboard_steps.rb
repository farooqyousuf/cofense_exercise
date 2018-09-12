Given("I click on the Yes I am ProBoard certified link") do
  @PBFirefighter.click_verify_firefighter_pb_link
end

Given("I verify using a ProBoard Firefighter") do
  @PBFirefighter.verify(type: "unique")
  click_link("Continue")
end

Given("I submit the empty ProBoard Firefighter form") do
  @PBFirefighter.verify(populate: false)
end

Given("I submit the proboard firefighter verification form as a {string} record") do |type|
  @PBFirefighter.verify(type: type)
end
