Given("I compare a exact match csv file against the original csv document") do
  original = CSV.read("test_documents/aamva_1.txt")
  expect(original).to eq(original)
end

Given("I compare a missing driver's licenses csv file against the original csv document") do
  original = CSV.read("test_documents/aamva_1.txt")
  second = CSV.read("test_documents/aamva_2.txt")
  expect(original).to eq(second)
end
