module PageObjectModel
  class InfoPage < PageObjectModel::Page
    trait "UINavigationBar marked:'Info'"
  end
end

module PageObjectModel
  def info_page
    @_info_page ||= page(InfoPage)
  end
end