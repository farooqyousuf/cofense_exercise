# ID.me Revelator

Revelator is a repository that contains ID.me's automated tests.  It is used to verify that the newly built and/or updated features do not break the primary features within there respective applications.

## Setup Instructions

1. Clone the repositiory `git clone git@github.com:IDme/idme-revelator.git`
2. Install GeckoDriver
3. Install Chromedriver
4. `bundle update`
5. `bundle install`
6. Update Browsers to the latest version

### Installing GeckoDriver

Check to see if GeckoDriver is currently installed
```bash
$ geckodriver --version
=> geckodriver 0.19.1

The source code of this program is available from
testing/geckodriver in https://hg.mozilla.org/mozilla-central.

This program is subject to the terms of the Mozilla Public License 2.0.
You can obtain a copy of the license at https://mozilla.org/MPL/2.0/.
```
There are multiple ways to install GeckoDriver

One way is to install GeckoDriver using [brew](https://brewinstall.org/Install-geckodriver-on-Mac-with-Brew/)
```bash
brew install geckodriver
```

Another way is to manually install [GeckoDriver](https://github.com/mozilla/geckodriver) with the latest [GeckoDriver Release](https://github.com/mozilla/geckodriver/releases)

### Installing Chromedriver

Check to see if Chromedriver is currently installed
```bash
$ chromedriver --version
=> ChromeDriver 2.35.528157 (4429ca2590d6988c0745c24c8858745aaaec01ef)
```

Install using [brew](https://brewinstall.org/Install-geckodriver-on-Mac-with-Brew/)
```bash
brew install chromedriver
```
## Running Revelator

### 1) Set up the environment
Set the env.rb file depending on the environment. IDme uses the
[Thor Ruby Gem](http://whatisthor.com/) to manage this.


Review the list of environments
```bash
thor list
```

It will print
```bash
thor set:android_saucelabs         # Use Android on Sauce Labs on Staging
thor set:chrome_osx                # Use Chrome on OSX locally on staging
thor set:chrome_windows            # Use Chrome on Windows on Sauce Labs on P...
thor set:firefox_osx_accept_certs  # Use Firefox on OSX and accept all certs
thor set:firefox_osx_local         # Use Firefox on OSX on Local
thor set:firefox_osx_sandbox       # Use Firefox on OSX on Sandbox (currently only supports ARCS direct api tests)
thor set:firefox_osx_production    # Use Firefox on OSX on Production
thor set:firefox_osx_saucelabs     # Use Firefox on OSX on Sauce Labs
thor set:firefox_osx_staging       # Use Firefox on OSX on Staging
thor set:firefox_windows           # Use Firefox on Windows on Sauce Labs on ...
thor set:ie_windows                # Use Internet Explorer on Windows on Sauc...
thor set:ios_local                 # Use iOS locally on Staging
thor set:ios_saucelabs             # Use iOS on Sauce Labs on Staging
thor set:safari_local              # User Safari locally on Staging
thor set:safari_saucelabs          # Use Safari on SauceLabs on Staging
```

### Run the appropriate thor command to set the environment
For **INT** tests with Firefox Browser
```bash
thor set:firefox_osx_staging
```

For **CORE** tests with Chrome Browser
```bash
thor set:chrome_osx
```

It will print something like this
```bash
run  cp features/support/environments/env.rb.firefox_osx_staging features/support/env.rb from "."
```
### 2) Run tests using cucumber

Review the feature file to be tested

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
To test a feature, enter [cucumber](https://github.com/cucumber/cucumber/wiki/Running-Features) in the CLI and append the feature file you would like to run afterwards.  See the following example.
```
cucumber features/feature_directory/test_file.feature
```

To test a specific scenario within a feature, add a colon and the line number of that scenario.  The example below runs **Scenario 2**.
```
cucumber features/feature_directory/test_file.feature:16
```

[Tags](https://github.com/cucumber/cucumber/wiki/Tags) tests all files and scenarios where the tag is listed.  To test all files and/or scenarios with the @test tag, add `--tags` plus the `@test` tag afterwards.
```
cucumber --tags @test
```

## For more information on revelator, please review the [QA Docs](https://github.com/IDme/docs/blob/master/04_Quality_Assurance/01_QA_Resource_Guide/revelator.md)
