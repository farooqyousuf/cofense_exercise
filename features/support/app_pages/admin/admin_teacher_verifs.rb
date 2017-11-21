require_relative "../base_classes/js_alerts"

class AdminTeacherVerifs < IDmeBase

include PageManagement
include JavascriptAlerts

  def initialize
    super("#{FigNewton.admin.base_url}/users")
  end

  def approve_doc
    open_newest
    click_on("Verify user")
    select("Teacher", :from => "affiliation_group_id")
    uncheck("Sandbox")
    fill_in "Comment", :with => "I am a teacher"
    click_button("Verify")
  end

  def deny_doc
    open_newest
    find("#decision_deny").click
    select('Other', :from => 'verification_attempt_reason_id')
    click_button("Update")
  end

  def open_newest
    first('.odd > td > a').click
  end

end
