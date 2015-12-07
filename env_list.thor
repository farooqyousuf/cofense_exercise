class Set < Thor
  include Thor::Actions

  no_tasks do
    def copy_environment(new_environment)
      run("cp features/support/environments/env.rb.#{new_environment} features/support/env.rb")
    end
  end

  desc "android_saucelabs", "Use Android on Sauce Labs on Production"
  def android_saucelabs
    copy_environment("android_saucelabs")
  end

  desc "ie_windows", "Use Internet Explorer on Windows on Sauce Labs on Production"
  def ie_windows
    copy_environment("ie_windows")
  end

  desc "firefox_windows", "Use Firefox on Windows on Sauce Labs on Production"
  def firefox_windows
    copy_environment("firefox_windows")
  end

  desc "chrome_windows", "Use Chrome on Windows on Sauce Labs on Production"
  def chrome_windows
    copy_environment("chrome_windows")
  end

  desc "firefox_osx_staging", "Use Firefox on OSX on Staging"
  def firefox_osx_staging
    copy_environment("firefox_osx_staging")
  end

  desc "firefox_osx_production", "Use Firefox on OSX on Production"
  def firefox_osx_production
    copy_environment("firefox_osx_production")
  end

  desc "ios_local", "Use iOS locally on Production"
  def ios_local
    copy_environment("ios_local")
  end

  desc "ios_saucelabs", "Use iOS on Sauce Labs on Production"
  def ios_saucelabs
    copy_environment("ios_saucelabs")
  end

  desc "chrome_osx", "Use Chrome on OSX on Sauce Labs on Production"
  def chrome_osx
    copy_environment("chrome_osx")
  end

end
