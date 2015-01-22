module PageObjectModel
  module ReaderActions
    def go_to_end_of_the_embedded_book
      go_to_end_of_book
      assert_end_of_sample_book
    end

    def go_to_end_of_book
      book_reader_page.move_slider_to_position(50)
      book_reader_page.close_web_reader_header_and_footer
      book_reader_page.turn_pages(1)
    end

    def verify_last_reading_position
      prev_chapter = book_reader_page.book_chapter
      prev_progress = book_reader_page.book_progress
      book_reader_page.get_header_and_footer_text
      expect(prev_chapter).to match(book_reader_page.book_chapter)
      expect(prev_progress).to match(book_reader_page.book_progress)
    end

    def choose_not_to_sign_in
      sleep 2
      touch("UILabel marked:'No'")
    end
  end
end

World(PageObjectModel::ReaderActions)