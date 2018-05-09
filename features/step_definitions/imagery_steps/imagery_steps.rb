Given("I compare the master aamva file against a {string} file") do |file|
  lines_master = File.foreach("test_documents/aamva_master.txt").count
  lines_diff = File.foreach("test_documents/aamva_#{file}.txt").count

  master = File.readlines("test_documents/aamva_master.txt")
  new_file = File.readlines("test_documents/aamva_#{file}.txt")

  if master == new_file
    puts "The #{file} file is an exact match to master."
  elsif lines_master > lines_diff #missing field, dl, or state
    diff = master - new_file
  else #added field, dl or state
    diff = new_file - master
  end

  puts "Master AAMVA file has #{lines_master} lines."
  puts "The new AAMVA file has #{lines_diff} lines."

  binding.pry

  if diff
    puts "There is one or more #{file} in the new file."
    diff.each_index do |x|
      puts "The #{file} is " + diff[x]
    end
  end

end
