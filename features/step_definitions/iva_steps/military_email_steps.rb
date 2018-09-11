Given("I verify using military email information for {string}") do |affiliation|
  @MilitaryEmail.verify(affiliation: affiliation, type: "unique")
end

Given("I submit the empty military email form for {string}") do |group|
  @MilitaryEmail.verify(affiliation: group, populate: false,)
end

Given("I submit the military email verification form as a {string} record") do |type|
  @MilitaryEmail.verify(affiliation: "Service Member", type: type)
end
