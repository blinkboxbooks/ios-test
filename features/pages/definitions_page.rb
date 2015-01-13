module PageObjectModel
  class DefinitionsPage < PageObjectModel::Page

    trait "UIButton marked:'Done'"
    element :done_button, "UIButton marked:'Done'"
    element :manage_button, "UIButton marked:'Manage'"
    element :search_web_button, "UIButton marked:'Search Web'"

  end

end

module PageObjectModel
  def definitions_page
    @_definitions_page ||= page(DefinitionsPage)
  end
end
