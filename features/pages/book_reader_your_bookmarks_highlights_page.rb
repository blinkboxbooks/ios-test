module PageObjectModel
  class BookReaderYourBookmarksHighlightsPage < PageObjectModel::Page
    trait "UILabel marked:'Your bookmarks'"
    element :title, "UILabel marked:'Your bookmarks'"
    element :bookmarks_tab, "UISegment marked:'Bookmarks'"
    element :highlights_tab, "UISegment marked:'Highlights'"
    element :edit_button, "UIButtonLabel marked:'Edit'"
    element :bookmark_book_title, "* accessibilityIdentifier:'label_bookmark_title'"
    element :bookmark_book_progress_label, "* accessibilityIdentifier:'label_bookmark_progress'"

    #sign_in_popup
    element :sign_in_popup_title, "UILabel marked:'Sign in' index:0"
    element :sign_in_button, "UILabel marked:'Sign in' index:1"
    element :no_button, "UILabel marked:'No'"

    def to_have_a_bookmark
      title.wait_for_element_exists(timeout: timeout_short)
      bookmark_book_title.selector
      bookmark_book_progress_label.selector
    end

    def tap_on_bookmark_link
      bookmark_book_title.wait_for_element_exists(timeout: timeout_short)
      bookmark_book_title.touch
    end

    def click_on_no_button
      sign_in_popup_title.wait_for_element_exists(timeout: timeout_short)
      no_button.touch
    end
  end
end

module PageObjectModel
  def book_reader_your_bookmarks_highlights_page
    @_book_reader_your_bookmarks_highlights_page ||= page(BookReaderYourBookmarksHighlightsPage)
  end
end