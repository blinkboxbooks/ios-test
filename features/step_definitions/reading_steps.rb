Given(/^I open the first book$/) do
  user_library_page.open_first_book
end

And(/turn (\d+) pages forward$/) do |pages_to_turn|
  book_reader_page.turn_pages(pages_to_turn)
end

And(/turn (\d+) pages backward$/) do |pages_to_turn|
  book_reader_page.turn_pages(-pages_to_turn.to_i.abs)
end

When(/^I open the first book for reading$/) do
  user_library_page.choose_from_options_menu("Read")
  expect_page(book_reader_page)
end

And(/^I set the book slider position to (\d+)$/) do |position|
  book_reader_page.move_slider_to_position(position)
end

Given(/^I invoke the (Define|Highlight) functionality on the reader$/) do |option|
  book_reader_page.invoke_callout_popup_and_choose(option)
end