Then(/^I should see the following links$/) do |links|
  links.rows.each { |x| check_view_with_mark_exists(x.first) }
end

And(/^I click on first embedded book options$/) do
  user_library_page.open_option_button
end

When(/^I click on the settings menu$/) do
  open_settings_menu
end