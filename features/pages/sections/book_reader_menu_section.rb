module PageObjectModel
  class BookReaderPageOptionsMenuSection < PageObjectModel::Page
    trait "WEPopoverContainerView UILabel marked:'Options'"
    element :option_menu, "WEPopoverContainerView UILabel marked:'Options'"
    element :reading_settings, "* marked:'Reading settings'"
    element :table_of_contents, "* marked:'Table of contents'"
    element :about_this_book, "* marked:'About this book'"
    element :bookmark_this_page, "* marked:'Bookmark this page'"
    element :your_bookmarks_and_highlights, "* marked:'Your Bookmarks and Highlights'"
  end
end
