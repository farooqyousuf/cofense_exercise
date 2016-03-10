require_relative '../base_classes/error_messages.rb'

class KBAQuestions < IDmeBase

  include IVABase
  include Capybara::DSL
  include ErrorMessages

  def questions
    page.all(:css, '.question')
  end

  def answers
    page.all('.answers')
  end

  def submit_answers
    click_button("Submit Answers")
  end

  def answer_questions
    i=0
    questions.each do |question|

      # Determine what the question is
      question_text = question.text.sub(/^\d.\s/, '')
      p "Question asked: #{question_text}"

      # Get the valid answer for the question
      question_data = KBA.find { |_, value| value["question"] == question_text }

      unless question_data
        p "Question not found: #{question_text}"
        page.save_screenshot('kba_questions.png')
        next
      end

      #This is accessing the answer value from the selected correct question from the kba.yml file
      valid_answer = question_data[1].select { |k, _| k =~ /answer/ }.values
      p "Valid answer: #{valid_answer}"

      #Set the radio buttons if they match one of the answers
      answers[i].choose(valid_answer[0])
        
      i +=1
    end
  end
end