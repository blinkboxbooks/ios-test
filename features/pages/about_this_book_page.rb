module PageObjectModel
  class AboutThisBookPage < PageObjectModel::Page
    trait "UINavigationBar UILabel text:'About this book'"
    element :book_title, "UILabel index:0" #bad!
    element :book_author, "UILabel index:1" #bad!
  end
end

module PageObjectModel
  def about_this_book_page
    @_about_this_book_page ||= page(AboutThisBookPage)
  end
end
