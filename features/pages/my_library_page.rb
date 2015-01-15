module PageObjectModel
  class MyLibraryPage < UserLibraryPage

    #trait "UISegment label {text BEGINSWITH 'My Library'}" #need to figure out how to get the selected value
    trait "UIImageView marked:'blinkbox_nav_logo'" #temp fix as we cant see the text!
    element :my_library_book_counter, "UISegmentLabel {text BEGINSWITH 'My Library'}"

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
