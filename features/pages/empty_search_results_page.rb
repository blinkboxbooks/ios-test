module PageObjectModel
  class EmptySearchResultsPage < PageObjectModel::Page
    trait "UILabel marked:'Sorry, there were no results\r that matched your search'"
  end
end

module PageObjectModel
  def empty_search_results_page
    @_empty_search_results_page ||= page(EmptySearchResultsPage)
  end
end
