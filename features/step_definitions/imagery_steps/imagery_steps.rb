Given("I compare the master aamva file against a {string} file") do |file|
  lines_master = File.foreach("test_documents/aamva_master.txt").count
  lines_diff = File.foreach("test_documents/aamva_#{file}.txt").count

  master = File.readlines("test_documents/aamva_master.txt")
  new_file = File.readlines("test_documents/aamva_#{file}.txt")

  if lines_master == lines_diff
    puts "The #{file} file is an exact match to master."
  else
    puts "There is one or more #{file} in the new file."
    diff = master - new_file
    puts "Master AAMVA file has #{lines_master} lines."
    puts "The new AAMVA file has #{lines_diff} lines."
    puts "The #{file} is #{diff}"
  end
end
