module PageModels
  module SearchAndBrowseAsserts
    def search_suggestions_should_be_visible
      expect(search_page.search_suggestions).to be_visible
    end

    def assert_search_results(search_word)
      expect_page(search_results_page)
      expect(search_results_page.search_field.text).to eq(search_word)
    end

    def get_book_details
      @book_author, @book_title = get_first_book_details_from_about_page
    end

    def assert_author_name(author_name)
      get_book_details
      #@book_author = get_first_book_details_from_about_page
      #authors = search_results_page.book_author.get_text
      expect(@book_author.downcase).to eq(author_name.downcase)
    end

    def assert_title(book_title)
      get_book_details
      #@book_title = get_first_book_details_from_about_page
      #titles = search_results_page.book_title.get_text
      expect(@book_title.downcase).to eq(book_title.downcase)
    end

    def assert_unique_result
      wait_for(timeout:5) { expect(search_results_page.number_of_books).to eq(1) }
    end

    def assert_book_details(book_title, author_name)
      get_book_details
      expect(@book_author.downcase).to eq(author_name.downcase)
      expect(@book_title.downcase).to eq(book_title.downcase)
    end

  end
end

World(PageModels::SearchAndBrowseAsserts)
