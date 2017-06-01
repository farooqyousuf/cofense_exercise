# ID.me Revelator

Revelator is a repository that contains ID.me's automated regression tests.  It is used to verify that the newly built and updated features dos not break the primary features within there respective applications.

## Setup Instructions
The following must be installed
* Thor
* Capybara
* Cucumber
* Firefox v.45

### Installing Thor
Check if thor is already installed
```
$ thor -v
Thor 0.19.1
```

Install thor
```
gem install thor
```
## Running Revelator

### 1) Set up your environment using thor
Review the environments
```
thor list
```

It will print
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

### Run the appropriate thor command to set the environment
**INT** tests with Firefox Browser
```
thor set:firefox_osx_staging
```

**CORE** tests with Firefox Browser
```
thor set:firefox_osx_staging
```

**Partner** tests with Firefox Browser
```
thor set:firefox_osx_production
```

Prints something like this
```
run  cp features/support/environments/env.rb.firefox_osx_staging features/support/env.rb from "."
```
- cucumber
- features
- tags
## Building tests
- Structure
- Changelog
## Resources
- links
