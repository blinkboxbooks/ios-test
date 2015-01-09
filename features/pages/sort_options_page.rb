module PageObjectModel
  class SortOptionsPage < PageObjectModel::Page
    trait "UINavigationBar marked:'Sort Options'"
  end
end

module PageObjectModel
  def sort_options_page
    @_sort_options_page ||= page(SortOptionsPage)
  end
end