class CashBack_PurchasesPage < IDmeBase
  include IDPBase

  def initialize
    super(FigNewton.shop.cashback_purchases_homepage)
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

  def click_update_payment_settings_dashboard_button
    find(".dashboard__payment-info .button").click
  end

  def select_amazon_payment_method
    find(".payment-option-radios span:nth-child(2)").click
  end

  def select_paypal_payment_method
    find(".payment-option-radios span:nth-child(1)").click
  end

  def update_paypal_email
    click_button("Update Payment Settings")
  end

  def enter_paypal_email
    find(:xpath, "//*[@id='user_paypal_account']").set(FigNewton.oauth.paypal_user)
  end

  def record_new_user_email
    @user_identifier = find(".user-menu__header").text
  end

  def click_on_my_cash
    first(:link, "My Cash").click
  end
end
