class CashBack_PurchasesPage < MarketplaceBase

  def initialize
    super(FigNewton.marketplace.cashback_purchases_homepage)
  end

  def cash_back_activity_tab_selected
    sleep 2
    first(".selected").has_link?("Cash Back Activity")
  end

  def cash_back_summary_section
    find(".container .dashboard__info-card__body", :text => "Cash Back")
  end

  def next_payment_summary_section
    find(".container .dashboard__info-card__body", :text => "Payment Date")
  end

  def purchase_table_section
    find("div#cash-back-purchases")
  end

  def check_purchases_made
    #add conditional to check against cash_back_current_quarter
    find("div#cash-back-purchases").has_text?("You haven’t made any purchases through ID.me.")
  end
end
