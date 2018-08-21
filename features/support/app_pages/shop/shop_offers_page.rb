class ShopOffersPage < IDmeBase
  include IDPBase

  def initialize
    super(FigNewton.shop.offers_index_page)
  end

  def click_groups_teacher_sidebar_link
    find(".filter__links li:nth-child(5)").click
  end

  def click_group(group)
    all("span", :text => "#{group}")[0].click
  end

  def click_mobile_hamburger_menu
    find(".hamburger").click
  end

  def click_mobile_signin
    click_mobile_hamburger_menu
    click_on("Sign In")
  end

  def click_mobile_signup
    click_mobile_hamburger_menu
    click_on("Sign Up")
  end

  def click_stores_link
    click_on("STORES")
  end

  def verify_group_offer(group)
    # This method checks that all group offers shown matches group offer filtered
    (0..11).each do |offer|     # (0..11) Represent the 12 offer cards shown
      group_offer = all(".store_cards_array-card")[offer].text.split("\n")[0]
      group_offer.should == group
    end
  end
end
