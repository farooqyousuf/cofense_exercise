require_relative "../base_classes/page_mgmt"

class AdminSettings < IDmeBase

include PageManagement

  def initialize
    super("#{FigNewton.admin.base_url}/settings")
  end

  def set_vendor_env(settings: "none")
    vendors = ["experian_env", "confirmio_env", "au10tix_env", "plaid_env", "nsc_env", "npi_env", "scra_env", "usaa_env", "fraudnet_env", "phone_checks", "dupe_checks"]

    env = case settings
          when "verify via Confirm.io", "verify via AU10TIX", "fail experian"
            ["Staging", "Mock", "Mock", "Mock", "Production", "Production", "Production", "Mock", "Disable", "Disable", "On"]
          when "fail documentation"
            ["Staging", "Mock", "Mock Fail", "Mock", "Production", "Production", "Production", "Mock", "Disable", "Disable", "On"]
          when "Staging"
            ["Staging", "Staging", "Staging", "Mock", "Production", "Production", "Production", "Production", "Disable", "Disable", "On"]
          end

    vendors.zip(env).each do |vendor, env|
      select(env, :from => vendor)
    end

    click_button("Update")
  end
end
