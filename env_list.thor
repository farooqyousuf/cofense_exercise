class Set < Thor
  include Thor::Actions
  
  no_tasks do
    def copy_environment(new_environment)
      run("cp features/support/environments/env.rb.#{new_environment} features/support/env.rb")
    end
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
  
end