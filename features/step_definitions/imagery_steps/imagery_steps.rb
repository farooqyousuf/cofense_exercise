Given("I compare a exact match csv file against the original csv document") do
  original = CSV.read("test_documents/aamva_master.txt")
  new_file = CSV.read("test_documents/aamva_exact_match.txt")
  flag = expect(original).to eq(new_file)
  if flag == true
    puts "Both AAMVA files are an exact match"
  else
    puts "The AAMVA files are not an exact match"
  end
end

Given("I compare a missing driver's licenses csv file against the original csv document") do
  original = CSV.read("test_documents/aamva_master.txt")
  second = CSV.read("test_documents/aamva_missing_dl.txt")
  expect(original).not_to eq(second)
end

Given("I compare the master aamva file against an aamva file that has a missing field") do
  lines_master = File.foreach("test_documents/aamva_master.txt").count
  lines_missing_field = File.foreach("test_documents/aamva_missing_field.txt").count

  master = File.readlines("test_documents/aamva_master.txt")
  new_file = File.readlines("test_documents/aamva_missing_field.txt")

  if lines_master == lines_missing_field
    puts "There is no missing field in the new file."
  else
    puts "There is one or more missing fields in the new file."
    diff = master - new_file
    puts "Master AAMVA file has #{lines_master} lines."
    puts "The new AAMVA file has #{lines_missing_field} lines."
    puts "The missing field is #{diff}"
  end
end
