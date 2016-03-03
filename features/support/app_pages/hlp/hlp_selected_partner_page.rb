class HlpPartnerPage < IDmeBase
  include IDPBase
  include DataMagic

  def initialize
  end

  def partner_page_already_exists(hlp_sample_page_type )
    find("#DataTables_Table_0").has_text? hlp_sample_page_type
  end

  def select_existing_page(hlp_sample_page_type )
    find("a",:text => hlp_sample_page_type  , match: :prefer_exact).click
  end

  def click_add_ungated_page_link
    click_link "Add UngatedPage"
  end

  def select_original_ungated_page
    find("a",:text => FigNewton.hlp_page_test_data.ungated_page.name).click
  end

end
