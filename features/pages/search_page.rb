module PageObjectModel
  class SearchPage < PageObjectModel::Page

    trait "UILabel {text CONTAINS 'Search books in your library'}"
    element :search_field, "UISearchBar placeholder:'Search samples"
    element :clear_search_field_button, "UIButton index:1"#"* marked:'Clear text'"
    element :search_suggestions, "BBBSuggestionTableViewCell"
    element :done_button, "UINavigationButton marked:'Done'"

    def search_suggestions_for(string)
      search_field.wait_tap(timeout: timeout_short)
      keyboard_enter_text string
    end

    def search_results
      search_suggestions.wait_for_element_exists(timeout: timeout_short)
      search_suggestions.get_text
    end

  end
end

module PageObjectModel
  def search_page
    @_shop_page ||= page(SearchPage)
  end
end
