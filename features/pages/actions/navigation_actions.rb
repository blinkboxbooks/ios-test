module PageObjectModel
  module NavigationActions
    require 'calabash-cucumber/core'

    def navigate_back_to_my_library_from_book_reader
      book_reader_page.invoke_web_reader_header_and_footer
      book_reader_page.reading_header_bar.back_button.wait_tap
      expect_page(my_library_page)
    end

    def navigate_back_to_my_library
      book_reader_page.go_back
      expect_page(my_library_page)
    end
  end
end

World(PageObjectModel::NavigationActions)