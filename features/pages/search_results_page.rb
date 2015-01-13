module PageObjectModel
  class SearchResultsPage < SearchPage
    trait "UILabel {text LIKE 'Free ebook samples (*)'}"

    element :book, "BBBBookCollectionViewCell"

    #section :search_toolbar, SearchToolBarSection
    #section :book_results_sections, BookResultsSection

    def number_of_books
      query(book.selector).size
    end

  end
end

module PageObjectModel
  def search_results_page
    @_search_results_page ||= page(SearchResultsPage)
  end
end