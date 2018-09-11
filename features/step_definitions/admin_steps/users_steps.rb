Given("I verify user level properties for {string}") do |affiliation|
  visit_admin_users_in_new_window
  sleep 3
  all('td')[0].click #click on the very first user in the table

  @user_edit = UserEdit.new

  @user_edit.collect_user_properties
  @user_edit.compare_expected_and_actual_levels(affiliation)
end
