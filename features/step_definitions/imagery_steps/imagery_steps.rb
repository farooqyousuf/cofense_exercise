Given("I compare an {string} csv file against the source document") do |file|
  original = CSV.read("test_documents/aamva_master.txt")
  new_file = CSV.read("test_documents/aamva_#{file}.txt")
  case file
  when "exact_match"
    flag = expect(original).to eq(original)
    if flag == true
      puts "Both AAMVA files are an exact match"
    else
      puts "The AAMVA file is #{file}"
      expect(new_file).not_to eq(original)
    end
  end
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
