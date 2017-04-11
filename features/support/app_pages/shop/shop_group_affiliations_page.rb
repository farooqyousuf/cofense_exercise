class ShopGroupAffiliationsPage < IDmeBase
  include IDPBase
  include RSpec::Matchers

  def initialize
    super(FigNewton.shop.group_affiliations_page)
  end

  def navigate_to_group_affiliation_page_from_shop_homepage
    find(".user-nav").click
    find(".js-close-modal").click
    find(:link, :href =>"/cash-back/activities/verify-group-affinity").click
    find(:link, :href =>"/cash-back/group-affiliations").click
  end

  def click_verify_military_affiliation_link
    find(:link, :text =>"Military").click
  end

  def click_verify_teacher_affiliation_link
    find(:link, :text =>"Teachers").click
  end

  def click_verify_first_responder_affiliation_link
    find(:link, :text =>"First Responders").click
  end

  def click_verify_government_affiliation_link
    find(:link, :text =>"Government Employees").click
  end

  def click_verify_student_affiliation_link
    find(:link, :text =>"Students").click
  end
end