require_relative "../base_classes/page_mgmt"

class AdminSettings < IDmeBase

include PageManagement

  def initialize
    super("#{FigNewton.admin.base_url}/settings")
  end

  def set_vendor_env
    vendors = ["usaa_env", "experian_env", "au10tix_env", "confirmio_env", "plaid_env", "fraudnet_env", "phone_checks"]
    env     = ["Mock", "Staging", "Mock", "Mock", "Mock", "Disable", "Disable"]

    vendors.zip(env).each do |vendor, env|
      select(env, :from => vendor)
    end

    click_button("Update")
  end
end
