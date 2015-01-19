module PageObjectModel
  class TableOfContentsPage < PageObjectModel::Page

    attr_accessor :content_book_title

    trait "UILabel marked:'Table of contents'"
    element :title_page_link, "UITableViewLabel marked:'Title page'"
    element :content_book_title, "UINavigationBar UINavigationItemView UILabel index:1"

    def select_chapter_link
      title_page_link.wait_tap(timeout: timeout_short)
    end

    def get_content_book_title
      @content_book_title = content_book_title.text
      return @content_book_title
    end

  end
end

module PageObjectModel
  def table_of_contents_page
    @_table_of_contents_page ||= page(TableOfContentsPage)
  end
end