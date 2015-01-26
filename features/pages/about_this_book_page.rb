module PageObjectModel
  class AboutThisBookPage < PageObjectModel::Page

    attr_accessor :about_this_book_title, :about_this_book_author

    trait "UINavigationBar UILabel text:'About this book'"
    element :book_title, "UILabel index:0" #bad!
    element :book_author, "UILabel index:1" #bad!

    def get_book_and_author_details_from_about_this_book
      @about_this_book_title = book_title.text
      @about_this_book_author = book_author.text
      return @about_this_book_title,@about_this_book_author
    end

  end
end

module PageObjectModel
  def about_this_book_page
    @_about_this_book_page ||= page(AboutThisBookPage)
  end
end
