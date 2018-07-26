require_relative '../base_classes/error_messages.rb'

class KBAQuestions < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def questions
    page.all(:css, '.question')
  end

  def submit_answers
    click_on("Submit answers")
  end

  def answer_questions
    questions.each_with_index do |question, index|

      # Determine what the question is
      question_text = question.text.sub(/^\d.\s/, '')
      p "Question asked: #{question_text}"

      # Get the valid answer for the question
      question_data = KBA.find { |_, value| value["question"] == question_text }

      unless question_data
        p "Question not found: #{question_text}"
        page.save_screenshot('kba_questions.png')
        all("label", :text => "NONE OF THE ABOVE/DOES NOT APPLY")[index].click
        p "Default answer: NONE OF THE ABOVE/DOES NOT APPLY"
        next
      end

      #This is accessing the answer value from the selected correct question from the kba.yml file
      valid_answers = question_data[1].select { |k, _| k =~ /answer/ }.values
      p "Valid answer: #{valid_answers}"

      #Set the radio buttons if they match one of the answers
      all("label", :text => valid_answers[0])[index].click
    end
  end

end
