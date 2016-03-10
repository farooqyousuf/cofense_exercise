Given(/^I submit information for "([^"]*)"$/) do |level|
	case level
	when "LOA2"
		LOA2.new.verify
	end
end

Given(/^I answer the KBA questions$/) do
  kba_questions = KBAQuestions.new
  kba_questions.answer_questions
  kba_questions.submit_answers
end

Given(/^I confirm my phone$/) do
  ConfirmPhone.new.confirm_phone
end

