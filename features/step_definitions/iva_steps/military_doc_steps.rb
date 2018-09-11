Given("I click on the Military Verify by uploading documentation link") do
  @MilitaryDoc.click_verify_mildoc_link
end

Given("I verify using military documentation for {string}") do |affiliation|
  step 'I generate a unique "png" doc'
  @MilitaryDoc.verify(affiliation: affiliation, type: "unique")
end

Given("I submit the empty military document form for {string}") do |group|
  @MilitaryDoc.verify(affiliation: group, populate: false)
end

Given("I submit the military document verification form as a {string} record") do |type|
  @MilitaryDoc.verify(affiliation: "Service Member", type: type)
end
