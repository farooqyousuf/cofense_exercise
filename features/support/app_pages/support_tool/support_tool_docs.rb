require_relative "../base_classes/js_alerts"

class SupportToolDocs < IDmeBase

include PageManagement
include JavascriptAlerts

  def initialize
    super("#{FigNewton.support_tool.base_url}/verification/attempts")
  end
end
