Given(/^I submit information for "([^"]*)"$/) do |level|
	case level
	when "LOA2"
		LOAInfo.new.verify
  when "LOA3"
    LOAInfo.new.verify(level)
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

Given(/^I should see the information collection screen(?: for (LOA[1-3]))$/) do |level|
  loa_info = LOAInfo.new

  expect(loa_info).to have_css(loa_info.phone_field)
  page.title.should == loa_info.page_title

    case level
    when "LOA2"
      expect(loa_info).not_to have_css(loa_info.credit_card)
    when "LOA3"
      expect(loa_info).to have_css(loa_info.credit_card)
    end
end
