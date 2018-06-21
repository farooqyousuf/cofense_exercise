class Set < Thor
  include Thor::Actions

  no_tasks do
    def copy_environment(new_environment)
      run("cp features/support/environments/env.rb.#{new_environment} features/support/env.rb")
    end
  end

  desc "android_native_mobile_local", "Use Android Native on Local"
  def android_native_mobile_local
    copy_environment("android_native_mobile_local")
  end

  desc "firefox_54_osx_saucelabs", "Use Firefox v54 on OSX on Sauce Labs"
  def firefox_54_osx_saucelabs
    copy_environment("firefox_54_osx_saucelabs")
  end

  desc "firefox_osx_accept_certs", "Use Firefox on OSX and accept all certs"
  def firefox_osx_accept_certs
    copy_environment("firefox_osx_accept_certs")
  end

  desc "firefox_osx_saucelabs", "Use Firefox on OSX on Sauce Labs"
  def firefox_osx_saucelabs
    copy_environment("firefox_osx_saucelabs")
  end

  desc "android_saucelabs", "Use Android on Sauce Labs on Staging"
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

  desc "firefox_osx_local", "Use Firefox on OSX on Local"
  def firefox_osx_local
    copy_environment("firefox_osx_local")
  end

  desc "firefox_osx_staging", "Use Firefox on OSX on Staging"
  def firefox_osx_staging
    copy_environment("firefox_osx_staging")
  end

  desc "firefox_osx_sandbox", "Use Firefox on OSX on Sandbox"
  def firefox_osx_sandbox
    copy_environment("firefox_osx_sandbox")
  end

  desc "firefox_osx_production", "Use Firefox on OSX on Production"
  def firefox_osx_production
    copy_environment("firefox_osx_production")
  end

  desc "ios_local", "Use iOS locally on Staging"
  def ios_local
    copy_environment("ios_local")
  end

  desc "ios_saucelabs", "Use iOS on Sauce Labs on Staging"
  def ios_saucelabs
    copy_environment("ios_saucelabs")
  end

  desc "chrome_osx", "Use Chrome on OSX locally on staging"
  def chrome_osx
    copy_environment("chrome_osx")
  end

  desc "iphonex_emulator", "Use iPhone X emulator within Chrome"
  def iphonex_emulator
    copy_environment("iphonex_emulator")
  end

  desc "safari_saucelabs", "Use Safari on SauceLabs on Staging"
  def safari_saucelabs
    copy_environment("safari_saucelabs")
  end

  desc "safari_local", "User Safari locally on Staging"
  def safari_local
    copy_environment("safari_local")
  end

end
