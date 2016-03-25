
Given(/^I should see the edit hlp page tab elements$/) do
  ["Duplicate Page","Delete Page","Preview"].each do |edit_link|
    expect(page).to have_link(edit_link)
  end

  ["Launch Page","Update"].each do |edit_button|
    expect(page).to have_button(edit_button)
  end
end
