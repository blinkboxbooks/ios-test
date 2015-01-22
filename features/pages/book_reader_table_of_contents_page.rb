module PageObjectModel
  class BookReaderTableOfContentsPage < PageObjectModel::Page
    trait "UILabel marked:'Table of contents'"
    element :title_page_link, "UITableViewLabel marked:'Title page'"
    element :other_title_page_link, "UITableViewLabel marked:'Title Page'"

    def select_chapter_link
      if element_exists("UITableViewLabel marked:'Title page'")
        touch("UITableViewLabel marked:'Title page'")
      elsif element_exists("UITableViewLabel marked:'Title Page'")
        touch("UITableViewLabel marked:'Title Page'")
      end
    end
  end
end

module PageObjectModel
  def book_reader_table_of_contents_page
    @_book_reader_table_of_contents_page ||= page(BookReaderTableOfContentsPage)
  end
end
