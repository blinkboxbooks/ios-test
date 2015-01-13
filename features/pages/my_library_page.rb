module PageObjectModel
  class MyLibraryPage < UserLibraryPage

    #trait "UISegment label {text BEGINSWITH 'My Library'}" #need to figure out how to get the selected value
    trait "UIImageView marked:'blinkbox_nav_logo'" #temp fix as we cant see the text!

  end
end

module PageObjectModel
  def my_library_page
    @_my_library_page ||= page(MyLibraryPage)
  end
end
