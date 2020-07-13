# Cofense SDET Exercise

## For more information on setting up or executing this repository, please contact Farooq Yousuf (farooqyousuf1@gmail.com).

Note: All commands should be executed in a Terminal or Command Line Interface (CLI) on your system.

## Setup Cofense SDET Exercise Instructions

### 1. Install Ruby 2.6.3 (Project requirement)

* MacOS/Linux:
On MacOS Ruby should be pre-installed. Check version: "ruby -v"
To install 2.6.3, execute "ruby-install ruby 2.6.3"

* Windows:
Follow install instructions here: https://rubyinstaller.org/

* Managine multiple Ruby versions on your system? 
Install and use Ruby via RVM or Rbenv 
RVM: https://rvm.io/
Rbenv: https://github.com/rbenv/rbenv

For more information regarding installing Ruby see: https://www.ruby-lang.org/en/documentation/installation/


### 2. Installing Chromedriver

Check to see if Chromedriver is currently installed
execute "chromedriver --version"
=> ChromeDriver 83.0.4103.39 (ccbf011cb2d2b19b506d844400483861342c20cd-refs/branch-heads/4103@{#416})

Install using [brew] -- Homebrew Information: https://brew.sh/
If you need to install Homebrew see here: https://docs.brew.sh/Installation

execute "brew install chromedriver"


### 3. Bundle Install all the gems

Navigate to the project root directory via CLI and execute `bundle install`
Example: 
cd /Users/farooqyousuf/Documents/cofense_exercise
bundle install


## Executing Cofense SDET Exercise

### 2) Run tests using cucumber

To test a feature, enter [cucumber](https://github.com/cucumber/cucumber/wiki/Running-Features) in the CLI and append the feature file you would like to run afterwards.  See the following example.

cucumber features/cofense_api_tests/cofense_api_tests.feature

To test a specific scenario within a feature, add a colon and the line number of that scenario.  The example below runs **Scenario 2**.

cucumber features/cofense_api_tests/cofense_api_tests.feature:8

[Tags](https://github.com/cucumber/cucumber/wiki/Tags) tests all files and scenarios where the tag is listed.  

To test all files and/or scenarios with the @test tag, add `--tags` plus the `@test` tag afterwards.
cucumber --tags @test

The same can be done with other tags such as @api or @ui

## General Comments about Project structure and technologies/gems used

### General Structure
A genereal Cucumber (https://cucumber.io/) scaffolding structure was used for this project. The tests have been divided up as follows:
Cucumber Feature files -> Step Definitions

In a more complex project I would definitely used the Page Object Model to encapsulate all the various pages in their own classes and that level would be under the Step Definitions layer. In this case I didn't want to over-engineer and add unnecessary complexity and also wanted to finish and submit the exercise in a reasonable time.

### Data folder
There is a data folder that contains a data.yml file that would contain test data if need be in a more complex project. In this case it is part of the structure but not being used for the tests. Just a dummy holder directory and file.

#### Environments folder
This contains 3 yml files for testing in various environments (local, testing, production). The 'testing.yml' is being used by the env.rb to specify the urls being accessed in the tests. In real complex project the other yml files would be used accordingly as well.

### Features folder
This contains all the Cucumber feature files divided by API and UI Features

### Support folder
This contains an env.rb, this file is being used and contains the various requirements needed. It also declares the Chrome driver as a global variable that is used throughout the tests and also loads the "testing.yml" file to load the test URLs.

### Output folder
This contains the various output files that are generated after the tests have executed

### Misc Files
.ruby-gemset - Gemset name
.ruby-version - Ruby version
README.md - Documentation
Gemfile - All the required gems needed

### Gems

rspec - https://github.com/rspec/rspec
Used for assertions/expectations/etc

selenium-webdriver - https://rubygems.org/gems/selenium-webdriver/versions/2.53.4
Used for launching and driving the web browser

fig_newton - https://github.com/cheezy/fig_newton
Used for data management. The urls in the tests are stored in the environments directory under the yml files. Whichever yml file is called in the env.rb is the yml used. This gem allows us to call the URLs needed in the Step Definitions and only need to make the changes in the respective yml file.

pry - https://github.com/pry/pry
Used for debugging.

cucumber - https://rubygems.org/gems/cucumber/versions/2.4.0
Used for the Cucumber scaffolding/structure.

httparty - https://github.com/jnunemaker/httparty
Used for testing the REST API.

## For more information on setting up or executing this repository, please contact Farooq Yousuf (farooqyousuf1@gmail.com).