# NOTE: order matters here, hooks defined last will be ran first

#Actions performed before each scenario
After do |scenario|
  if scenario.failed?
    file = "FAILED_#{scenario.name.gsub(" ","_").gsub(/[^0-9A-Za-z_]/, "")}.png"

    # create directory for images
    Dir.mkdir("./output/screenshots") unless Dir.exists?("./output/screenshots")

    # save the file locally
    @browser.screenshot.save("./output/screenshots/#{file}")

    if AllureCucumber::FeatureTracker.tracker
      # attaches failed test screenshot to Allure reports
      attach_file(file, File.open("./output/screenshots/#{file}"))
    end
  end
end
