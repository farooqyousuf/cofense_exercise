Given(/^I submit information for "([^"]*)"$/) do |level|
	case level
	when "LOA2"
		LOA2.new.verify
	end
end


Given(/^I answer the KBA questions$/) do
  KBAQuestions.new.answer_questions
end
