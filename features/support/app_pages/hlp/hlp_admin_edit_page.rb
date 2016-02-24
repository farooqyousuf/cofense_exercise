class HlpAdminEditPage < IDmeBase
  include IDPBase
  include JavascriptAlerts

def initialize
end

def delete_hlp_page(hlp_page)
  click_link "Delete Page"
  js_accept 
end

end
