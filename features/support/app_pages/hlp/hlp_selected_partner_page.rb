class HlpPartnerPage < IDmeBase
  include IDPBase
  include DataMagic

  def initialize
  end

  def partner_page_already_exists(hlp_sample_page_type)
    find("#DataTables_Table_0").has_text? hlp_sample_page_type
  end

  def select_existing_page(hlp_sample_page_type)
    find("a", :text => hlp_sample_page_type, match: :prefer_exact).click
  end

  def click_add_ungated_page_link
    click_link "Add UngatedPage"
  end

  def click_add_gated_page_link
    click_link "Add GatedPage"
  end

  def click_add_promocode_page_link
    click_link "Add PromoCodePage"
  end

  def click_add_document_page_link
    click_link "Add DocumentPage"
  end

  def click_add_wufoo_page_link
    click_link "Add new WufooPage"
  end

  def select_original_document_page
    find("a", :text => FigNewton.hlp_page_test_data.document_page.name).click
  end

  def select_original_gated_page
    find("a", :text => FigNewton.hlp_page_test_data.gated_page.name).click
  end

  def select_original_promocode_page
    find("a", :text => FigNewton.hlp_page_test_data.promo_code_page.name).click
  end

  def select_original_wufoo_page
    find("a", :text => FigNewton.hlp_page_test_data.wufoo_code_page.name).click
  end
end
