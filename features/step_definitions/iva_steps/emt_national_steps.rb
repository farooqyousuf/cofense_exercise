Given("I click on the Verify using EMT National link") do
  @NationalEMT.click_verify_emt_national_link
end

Given("I verify using nationally certified EMT credentials") do
  @NationalEMT.verify(type: "unique")
end

Given("I submit the empty National EMT form") do
  @NationalEMT.verify(populate: false)
end

Given("I submit the emt national verification form as a {string} record") do |type|
  @NationalEMT.verify(type: type)
end
