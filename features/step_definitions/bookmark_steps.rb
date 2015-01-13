Given(/^I choose to add a bookmark using the Book Reader page$/) do
  book_reader_page.add_bookmark_via_webview_reader
end

Then(/^I choose to remove a bookmark using the Book Reader page$/) do
  book_reader_page.remove_bookmark_via_webview_reader
end