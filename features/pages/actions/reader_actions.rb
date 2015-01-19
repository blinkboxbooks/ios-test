module PageObjectModel
  module ReaderActions

    def navigate_back_to_user_library
      book_reader_page.click_on_the_back_button
      expect_page(user_library_page)
    end

  end
end

World(PageObjectModel::ReaderActions)
