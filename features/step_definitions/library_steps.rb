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

When(/^I click on option menu on book not downloaded$/) do
  user_library_page.open_option_button
end

And(/^I click on (My Library|Reading) tab$/) do |negate|
  goto_user_library_tab(negate)
end

Given(/^I capture the current number of books in My Library$/) do
  user_library_page.dismiss_info_panel
  @my_lib_book_count = my_library_page.current_number_of_books_in_my_library
end

When(/^I choose to Remove a book from my Library$/) do
  user_library_page.remove_book_from_my_library
end

Then(/^the number of books in My Library should decrease by one$/) do
  expect(my_library_page)
  wait_for(:timeout => 5) {expect(my_library_page.current_number_of_books_in_my_library).to be < @my_lib_book_count}
end

Then(/^the number of books in Reading should decrease by one$/) do
  expect(reading_page)
  wait_for(:timeout => 5) {expect(reading_page.current_number_of_books_in_reading).to be < @my_reading_book_count}
end

Then(/^I capture the current Books' details via the About option$/) do
  get_first_book_details_from_about_page
end

Then(/^I should see the correct Contents shown$/) do
  expect_page(table_of_contents_page)
  expect(table_of_contents_page.content_book_title.text).to match(about_this_book_page.about_this_book_title)
end

Then(/^I capture book details via the Content option$/) do
  expect_page(table_of_contents_page)
  table_of_contents_page.get_content_book_title
end

Then(/^I see book details on about this book page$/) do
  expect_page(about_this_book_page)
  expect(about_this_book_page.book_title.text).to match(table_of_contents_page.content_book_title)
end

Then(/^I see book details on about this about from reader screen$/) do
  expect_page(about_this_book_page)
  expect(about_this_book_page.book_title.text).to match(about_this_book_page.about_this_book_title)
end

When(/^I capture number of books in Reading tab$/) do
  @my_reading_book_count = reading_page.current_number_of_books_in_reading
end


When(/^I download first book$/) do
  pending
end