Given(/^I have read the book to certain position$/) do
  book_reader_page.invoke_web_reader_header_and_footer
end

When(/^I open the book again$/) do
  read_first_book
end

Then(/^I should see last reading position$/) do
  verify_last_reading_position
end

Given(/^I have bookmarked a page$/) do
  book_reader_page.add_bookmark_via_webview_reader
end

And(/^I continue reading turning (\d+) pages forward$/) do |pages_to_turn|
  book_reader_page.turn_pages(pages_to_turn)
  book_reader_page.invoke_web_reader_header_and_footer
end

And(/^I tap on bookmark link$/) do
  book_reader_your_bookmarks_highlights_page.to_have_a_bookmark
  book_reader_your_bookmarks_highlights_page.tap_on_bookmark_link
end

And(/^I choose not to sign in$/) do
  choose_not_to_sign_in
end

And(/^I am on bookmarked page$/) do
  expect_page(book_reader_page)
  book_reader_page.remove_bookmark_icon.should be_visible
  book_reader_page.back_to_last_reading_position_link.exists? and book_reader_page.dismiss_button.exists?
end

When(/^I tap on go back to last reading position link$/) do
  book_reader_page.back_to_last_reading_position
end

Then(/^I should see correct last reading position$/) do
  expect_page(book_reader_page)
  verify_last_reading_position
end

And(/^I select a chapter link$/) do
  expect_page(book_reader_table_of_contents_page)
  book_reader_table_of_contents_page.select_chapter_link
end

And(/^I am on selected chapter$/) do
  expect_page(book_reader_page)
end

And(/^I exit the book$/) do
  navigate_back_to_my_library
end

Given(/^I exit the book to go back to library screen$/) do
  navigate_back_to_my_library_from_book_reader
end
