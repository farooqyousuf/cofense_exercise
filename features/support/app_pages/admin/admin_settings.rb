require_relative "../base_classes/page_mgmt"

class AdminSettings < IDmeBase

include PageManagement

  def initialize
    super("#{FigNewton.admin.base_url}/settings")
  end

  def set_vendor_env(settings: "none")
    vendors = %w(experian_env confirmio_env au10tix_env plaid_env nsc_env npi_env scra_env usaa_env fraudnet_env dupe_checks payfone_env telesign_env)

    env = case settings
          when "verify via Confirm.io", "verify via AU10TIX"
            %w(Mock Mock Mock Mock Production Production Production Mock Disable On Mock Mock)
          when "fail experian"
            %w(Staging Mock Mock Mock Production Production Production Mock Disable On Mock Mock)
          when "fail documentation"
            %w(Staging Mock Mock\ Fail Mock Production Production Production Mock Disable On Mock Mock)
          when "Staging"
            %w(Staging Staging Staging Mock Production Production Production Production Disable On Mock Mock)
          end

    vendors.zip(env).each do |vendor, env|
      select(env, :from => vendor)
    end

    click_button("Update")
  end
end
