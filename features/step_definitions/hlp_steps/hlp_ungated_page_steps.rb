
Given(/^I login with Authority$/) do
  authority = Authority.new
  authority.auth_login
end

Given(/^I check if page name has been already taken for the "([^"]*)"$/) do |page_type|
  visit "#{FigNewton.hlp.homepage}/partners/#{FigNewton.hlp.partner_number}/pages"
  pages = { "temp_hlp_document" => 'DocumentPage', "temp_hlp_gated" => 'GatedPage', "temp_hlp_promocode" => 'PromoCodePage', "temp_hlp_ungated" => 'UngatedPage' }
  hlp_page = pages["#{page_type}"]
  @partner_page_data = HlpPartnerPage.new
  @hlp_page_type = @partner_page_data.data_for :hlp_page_types
  @hlp_edit_page = HlpAdminEditPage.new

  if find("#DataTables_Table_0").has_text? "#{hlp_page}"
    find("a",:text => @hlp_page_type["#{page_type}"]["name"]).click
    @hlp_edit_page.delete_hlp_page(hlp_page)
    expect(find("#DataTables_Table_0").has_text?("#{hlp_page}")).to be(false)
  else
    puts "#{@hlp_page_type["#{page_type}"]["name"]} is free to use."
  end

end

Given(/^I visit the Add UngatedPage page$/) do
  click_link "Add UngatedPage"
end

Given(/^I create a new UngatedPage$/) do
  fill_in("ungated_page[name]",:with => @hlp_page_type["temp_hlp_ungated"]["name"])
  fill_in("ungated_page[redirect_url]", :with => @hlp_page_type["temp_hlp_ungated"]["page_redirect_url"])

  within_frame(find("#cke_1_contents").find(".cke_wysiwyg_frame")) do
      body = find("body")
      body.set(@hlp_page_type["temp_hlp_ungated"]["body_copy"])
  end
  click_button "Create"
end

Given(/^I should see UngatedPage edit page elements$/) do
  #this is now a new hlp edit admin page
  expect(page).to have_link "Duplicate Page"
  expect(page).to have_link "Delete Page"
  expect(page).to have_link "Preview"
  expect(page).to have_button "Launch Page"
  expect(page).to have_button "Update"
end

Given(/^I delete the "([^"]*)" hlp page$/) do |page_type|
  @hlp_edit_page.delete_hlp_page(page_type)
end
