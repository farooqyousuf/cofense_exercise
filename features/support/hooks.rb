# NOTE: order matters here, hooks defined last will be ran first

#Actions performed before each scenario
# After do |scenario|
#   if scenario.failed?

#     file = "FAILED_#{scenario.name.gsub(" ","_").gsub(/[^0-9A-Za-z_]/, "")}.png"

#     # create directory for images
#     Dir.mkdir("./output") unless Dir.exists?("./output")

#     # save the file locally
#     page.save_screenshot("./output/#{file}")

#     # This should attach screenshots to the Allure reports, but it's not working currently...
#     attach_file(file, File.open("./output/#{file}"))
#   end
# end
