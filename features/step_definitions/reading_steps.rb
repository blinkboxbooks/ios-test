Given(/^I open the first book$/) do
  user_library_page.open_first_book
  wait_for_book_reader_page
end

And(/turn (\d+) pages forward$/) do |pages_to_turn|
  book_reader_page.turn_pages(pages_to_turn)
end