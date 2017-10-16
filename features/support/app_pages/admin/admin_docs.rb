require_relative "../base_classes/js_alerts"

class AdminDocs < IDmeBase

include PageManagement
include JavascriptAlerts

  def initialize
    super("#{FigNewton.admin.base_url}/verification/documents")
  end

  def approve_doc
    open_newest
    find("#decision_accept").click
    click_button("Update")
  end

  def sort_newest_to_top
    sleep 1
    all(".short.sorting")[1].click
    sleep 1
    find(".sorting_asc").click
  end

  def open_newest
    sleep 1
    first('.odd > td > a').click
  end

  def verify_doc_upload(username)
    open_newest
    page.assert_text username
    find("tr:nth-child(12)").text.should == "Document Type .png" # Determines if document type ".png" is present
  end

  def verify_unique_doc_upload(username, document: "none")
    open_newest
    page.assert_text username
    find("tr:nth-child(12)").text.should == "Document Type .#{document}" # Determines if document type is present
  end
end
