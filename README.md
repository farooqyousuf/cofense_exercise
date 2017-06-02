# ID.me Revelator

Revelator is a repository that contains ID.me's automated tests.  It is used to verify that the newly built and updated features do not break the primary features within there respective applications.

## Setup Instructions

1. Clone the repositiory `git clone git@github.com:IDme/idme-revelator.git`
2. `bundle install`
3. Install Firefox version less than or equal to 45.0.1

### Installing Firefox v.45
Check what version of firefox is currently installed
```
$ /Applications/Firefox.app/Contents/MacOS/firefox -v
=> Mozilla Firefox 45.0.1
```

If the Firefox version is greater than 45.0.1, [uninstall Firefox](http://kb.mozillazine.org/Uninstalling_Firefox)
then [install Firefox v.45.0.1](https://ftp.mozilla.org/pub/firefox/releases/45.0.1/mac/en-US/)
. Be sure to disable Firefox updates.

## Running Revelator

### 1) Set up the environment
Review the list of environments
```
thor list
```

It will print
```bash
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
For **INT** tests with Firefox Browser
```
thor set:firefox_osx_staging
```

For **CORE** tests with Firefox Browser
```
thor set:firefox_osx_staging
```

For **USER** tests with Firefox Browser
```
thor set:firefox_osx_production
```

It will print something like this
```bash
run  cp features/support/environments/env.rb.firefox_osx_staging features/support/env.rb from "."
```
### 2) Run tests using cucumber

First view the feature file to be tested

`features/feature_directory/test_file.feature`
```ruby
1 @test @desktop
2 Feature: Testing a Test
3
4   Background:
5     * I visit the test
6     * I click on the test
7
8   @smoke @delete_user
9   #unique test
10  Scenario: Successful verification as Scenario 1
11    * I verify using test
12    * I approve the test
13    * I should be successfully verified as "Scenario 1"
14
15  @delete_user
16  Scenario: Successful verification as Scenario 2
17    * I verify using test
18    * I approve the test
19    * I should be successfully verified as "Scenario 2"
```
To test a feature enter **cucumber** in the CLI and append the feature file you would like to run afterwards.  See the following example.
```
cucumber features/feature_directory/test_file.feature
```

To test a specific scenario within a feature, add a colon and the line number of that scenario.  The example below runs Scenario 2.
```
cucumber features/feature_directory/test_file.feature:16
```

The tags tests all files and scenarios where the tag is listed.  To test all files and/or scenarios with the @test tag, add `--tags` plus the `@test` tag afterward.
```
cucumber --tags @test
```

## For more information on revelator, please review the [QA Docs](https://github.com/IDme/docs/blob/master/quality_assurance/qa_resource_guide/revelator.md)
