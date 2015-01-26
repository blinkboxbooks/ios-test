module PageObjectModel
  class MyLibraryPage < UserLibraryPage
    trait "UISegmentedControl UISegment UISegmentLabel {text BEGINSWITH 'My Library'} isSelected:true"
    element :my_library_book_counter, "UISegmentedControl UISegment UISegmentLabel {text BEGINSWITH 'My Library'}"

    def current_number_of_books_in_my_library
      x = my_library_book_counter.text
      x.scan(/\d+/).first.to_i
    end

  end
end

module PageObjectModel
  def my_library_page
    @_my_library_page ||= page(MyLibraryPage)
  end
end
