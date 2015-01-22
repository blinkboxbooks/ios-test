module PageObjectModel
  module ReaderActions
    def verify_last_reading_position
      prev_chapter = book_reader_page.book_chapter
      prev_progress = book_reader_page.book_progress
      book_reader_page.get_header_and_footer_text
      expect(prev_chapter).to match(book_reader_page.book_chapter)
      expect(prev_progress).to match(book_reader_page.book_progress)
    end

    def choose_not_to_sign_in
      book_reader_your_bookmarks_highlights_page.click_on_no_button
    end
  end
end

World(PageObjectModel::ReaderActions)