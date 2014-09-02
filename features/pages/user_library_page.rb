module PageObjectModel
  class UserLibraryPage < PageObjectModel::Page
    trait "* marked:'Your library'"
  end
end

module PageObjectModel
  def user_library_page
    @_user_library_page ||= page(UserLibraryPage)
  end
end
