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

  def answer_questions
    i=0
    questions.each do |question|

      # Determine what the question is
      question_text = question.text.sub(/^\d.\s/, '')

      # Get the valid answers for the question
      question_data = KBA.find { |_, value| value["question"] == question_text }

      unless question_data
        p "Question not found: #{question_text}"
        page.save_screenshot('kba_questions.png')
        next
      end

      #This is accessing the answer value from the selected correct question from the kba.yml file
      valid_answers = question_data[1].select { |k, _| k =~ /answer/ }.values

      #Set the radio buttons if they match one of the answers
      #correct_answer = answers[i].all(:radio_button).find do |radio|
      correct_answer = answers[i].all(:radio_button).find do |radio|
        valid_answers.include?(radio.parent.text)
        binding.pry
      end
        
      i +=1

      binding.pry
      unless @correct_answer
        p "Unable to answer question: #{question_text}" and next
      end

      correct_answer.select
    end
  end
end