class NewSurveyPage < IDmeBase

  include IDPBase
  include RSpec::Matchers

  def initialize
    super(FigNewton.marketplace.demographic_survey)
  end

  def navigate_to_new_demographic_survey_page
    page.execute_script "window.scrollBy(0,1300)"
    click_link "Complete a survey"
    sleep 1
    click_link "Continue"
  end

  def complete_survey
    page.find("label",:text => "Male").click
    page.find("label",:text => "18-24").click
    page.find("label",:text => "$24,000 or less").click
    page.execute_script "window.scrollBy(0,600)"
    page.find("label",:text => "Some college").click
  end
end
