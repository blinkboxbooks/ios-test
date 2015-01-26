module PageObjectModel
  class ReadingPage < UserLibraryPage
    trait "UISegmentedControl UISegment UISegmentLabel {text BEGINSWITH 'Reading'} isSelected:true"
    element :reading_book_counter, "UISegmentedControl UISegment UISegmentLabel {text BEGINSWITH 'Reading'}"

    def current_number_of_books_in_reading
      x = reading_book_counter.text
      x.scan(/\d+/).first.to_i
    end

  end
end

module PageObjectModel
  def reading_page
    @_reading_page ||= page(ReadingPage)
  end
end