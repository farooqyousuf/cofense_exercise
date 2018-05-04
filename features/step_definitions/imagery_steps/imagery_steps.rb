Given("I compare an {string} csv file against the source document") do |file|
  original = CSV.read("test_documents/aamva_exact_match.txt")
  comparison_file = CSV.read("test_documents/aamva_#{file}.txt")
  case file
  when "exact_match"
    flag = expect(original).to eq(original)
    if flag == true
      puts "Both AAMVA files are an exact match"
    else
      puts "The AAMVA files are not an exact match"
    end
  else
    expect(comparison_file).not_to eq(original)
  end
end
