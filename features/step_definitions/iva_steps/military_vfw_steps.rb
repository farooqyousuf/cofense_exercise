Given("I add a {string} vfw number to user") do |type|
  @MilitaryVFW.apply_vfw_num(populate: true, type: type)
end
