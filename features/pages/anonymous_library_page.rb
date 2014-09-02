module PageObjectModel
  class AnonymousLibraryPage < PageObjectModel::Page
    trait "* marked:'Sign in'"
  end
end

module PageObjectModel
  def anonymous_library_page
    @_anonymous_library_page ||= page(AnonymousLibraryPage)
  end
end
