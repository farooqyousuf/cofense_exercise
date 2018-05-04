Given("I compare a exact match csv file against the original csv document") do
  original = CSV.read("test_documents/aamva_1.txt")
  flag = expect(original).to eq(original)
  if flag == true
    puts "Both AAMVA files are an exact match"
  else
    puts "The AAMVA files are not an exact match"
  end
end

Given("I compare a missing driver's licenses csv file against the original csv document") do
  original = CSV.read("test_documents/aamva_1.txt")
  second = CSV.read("test_documents/aamva_2.txt")
  expect(original).not_to eq(second)
end
