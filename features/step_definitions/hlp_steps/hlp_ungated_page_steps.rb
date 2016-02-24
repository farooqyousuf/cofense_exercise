
Given(/^I login with Authority$/) do
  authority = Authority.new
  authority.auth_login
end

Given(/^I check if page name has been already taken for the "([^"]*)"$/) do |page_type|
  visit "#{FigNewton.hlp.homepage}/partners/#{FigNewton.hlp.partner_number}/pages"
  pages = { "temp_hlp_document" => 'DocumentPage', "temp_hlp_gated" => 'GatedPage', "temp_hlp_promocode" => 'PromoCodePage', "temp_hlp_ungated" => 'UngatedPage' }
  hlp_page = pages["#{page_type}"]
  @partner_page_data = HlpPartnerPage.new
  hlp_page_type = @partner_page_data.data_for :hlp_page_types
  @hlp_edit_page = HlpAdminEditPage.new

  if find("#DataTables_Table_0").has_text? "#{hlp_page}"
    find("a",:text => hlp_page_type["#{page_type}"]["name"]).click
    @hlp_edit_page.delete_hlp_page(hlp_page)
    expect(find("#DataTables_Table_0").has_text?("#{hlp_page}")).to be(false)
  else
    puts "#{hlp_page_type["#{page_type}"]["name"]} is free to use."
  end

end

Given(/^I visit the Add UngatedPage page$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I create a new UngatedPage$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
