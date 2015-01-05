module PageObjectModel
  class CommonTopNavSection < PageObjectModel::Page

    element :search_field, "* id:'search_src_text'"
    element :search_button, "UINavigationButton marked:'Search'"
    element :clear_search_field_button, "* marked:'Clear text'"
    element :search_suggestions, "BBBSuggestionTableViewCell"

  end
end
