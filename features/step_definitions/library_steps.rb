Then(/^I should see the following links$/) do |links|
  links.rows.each { |x| check_view_with_mark_exists(x.first) }
end

And(/^I click on first embedded book options$/) do
  user_library_page.open_option_button
end

When(/^I click on the settings menu$/) do
  open_settings_menu
end

When(/^I navigate to (.*) from the user library settings menu$/) do |settings_menu_item|
  open_settings_menu_and_choose(settings_menu_item)
end

And(/^I open the first book on the (My Library|Reading) page$/) do |negate|
  open_first_book_in_user_library(negate)
end
