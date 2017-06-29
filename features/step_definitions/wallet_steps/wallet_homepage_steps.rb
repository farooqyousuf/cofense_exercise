Given(/^I verify I am on the wallet homepage$/) do
  expect(page.current_url).to eql(FigNewton.wallet.homepage.url)
  expect(page.title).to eql(FigNewton.wallet.homepage.title)
end

Given(/^I verify that the wallet home hero is displayed$/) do
  expect(page).to have_css(".content-container",:text => "ID.me Wallet empowers you to manage all of the moving parts of your digital identity. With one login, you'll be able to easily access benefits and discounts from hundreds of partners. Start taking control of your digital identity today.")
  expect(page).to have_css(".wallet-home-hero-cta a",:visible => true)
end

Given(/^I verify the wallet sign in links direct to idp$/) do
  @WalletHomepage.click_shared_nav_sign_in_button
  expect(page).to have_current_path(FigNewton.idp.new_session_url,:url => true)
  return_to_previous_page
end

Given(/^I verify the wallet sign up links direct to idp$/) do
  %w[click_shared_nav_sign_up_button click_hero_sign_up_button click_portable_sign_up_button click_home_cta_sign_up_button].each do |method|
    @WalletHomepage.send(method)
    expect(page).to have_current_path(FigNewton.idp.new_registration_url,:url => true)
    return_to_previous_page
  end
end

Given(/^I verify the Wallet shared navigation tab "([^"]*)" successfully links$/) do |nav_tab|
  nav_link_url = case nav_tab
              when "About"    then FigNewton.idme.about_page
              when "Business" then FigNewton.idme.business_page
              when "Shop"     then FigNewton.wallet.shop
              when "Wallet"   then FigNewton.wallet.homepage.url
                 end

  if nav_tab == "Business"
    business_window = window_opened_by do
      find(".wallet-header-nav a",:text => nav_tab ).click
    end
    switch_to_window(business_window)
    expect(page).to have_current_path(nav_link_url, :url => true)
    close_current_browser
    use_last_browser_created
  else
    find(".wallet-header-nav a",:text => nav_tab ).click
    expect(page).to have_current_path(nav_link_url, :url => true)

    if nav_tab == "Shop"
      find(:xpath, "//a[@href='/subscription/not_now']").click
      visit FigNewton.wallet.homepage.url
    else
      return_to_previous_page
    end
  end
end

