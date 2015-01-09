module PageObjectModel
  class EmptyDefinitionsPage < PageObjectModel::Page

    trait "UILabel marked:'No definition found.'"

  end

end

module PageObjectModel
  def empty_definitions_page
    @_empty_definitions_page ||= page(EmptyDefinitionsPage)
  end
end
