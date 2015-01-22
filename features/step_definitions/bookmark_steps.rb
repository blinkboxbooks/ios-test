Given(/^I choose to add a bookmark using the Book Reader page$/) do
  book_reader_page.add_bookmark_via_webview_reader
end

Then(/^I choose to remove a bookmark using the Book Reader page$/) do
  book_reader_page.remove_bookmark_via_webview_reader
end

And(/^I visit the "([^"]*)" page from the Reader option menu$/) do |drawer_option|
  book_reader_page.choose_option_from_reading_menu(drawer_option)
end