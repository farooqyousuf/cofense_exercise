# ID.me Revelator

Before running you need to set the env.rb file depending on the environment. We use the
[Thor Ruby Gem](http://whatisthor.com/) to manage this. Just type in the appropriate command
below into the CLI before hand for the test environment you will require.

```
thor set:android_saucelabs       # Use Android on Sauce Labs on Production
thor set:chrome_osx              # Use Chrome on OSX on Sauce Labs on Production
thor set:chrome_windows          # Use Chrome on Windows on Sauce Labs on Production
thor set:firefox_osx_production  # Use Firefox on OSX on Production
thor set:firefox_osx_staging     # Use Firefox on OSX on Staging
thor set:firefox_windows         # Use Firefox on Windows on Sauce Labs on Production
thor set:ie_windows              # Use Internet Explorer on Windows on Sauce Labs on Production
thor set:ios_local               # Use iOS locally on Production
thor set:ios_saucelabs           # Use iOS on Sauce Labs on Production
```

## CHANGELOG

Before merging in pull-requests, update the [Change Log](CHANGELOG.md) with the
date (MM/DD/YY) and corresponding Jira ticket number and title. If need to push a fix straight to master then mark as HOTFIX. 