require_relative "../base_classes/page_mgmt"

class AdminSettings < IDmeBase

include PageManagement

  def initialize
    super("#{FigNewton.admin.base_url}/settings")
  end

  def set_vendor_env(settings: "none")
    vendors = ["usaa_env", "experian_env", "au10tix_env", "confirmio_env", "plaid_env", "fraudnet_env", "phone_checks"]

    env = case settings
          when "successfully verify confirm iO", "successfully verify au10tix"
            ["Mock", "Staging", "Mock", "Mock", "Mock", "Disable", "Disable"]
          end

    vendors.zip(env).each do |vendor, env|
      select(env, :from => vendor)
    end

    click_button("Update")
  end
end
