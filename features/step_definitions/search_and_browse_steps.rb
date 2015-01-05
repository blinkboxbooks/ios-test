When(/^I enter (.*) as the search term$/) do |search_string|
  @search_word = search_string
  search_page.search_suggestions_for(@search_word)
end

Then(/^I should see search suggestions$/) do
  search_suggestions_should_be_visible
end

Then(/^I choose to search from the (?:Reading|My Library) page$/) do
  search_from_user_library_page
end

And(/^I should see (.*) in the search suggestions$/) do |search_string|
  expect(search_page.search_results).to include(search_string)
end

Then(/^search results should be displayed$/) do
  assert_search_results @search_word
end

And(/^the author name of first book displayed should contain (.*)$/) do |author_name|
  assert_author_name author_name
end

And(/^the title of first book displayed should contain (.*)$/) do | book_title|
  assert_title book_title
end

Then(/^only one matching search result should be displayed$/) do
  assert_search_results @search_word
  assert_unique_result
end

And(/^the book name should be ([^"]*) and the author name should be ([^"]*)$/) do |book_title, author_name|
  assert_book_details(book_title, author_name)
end