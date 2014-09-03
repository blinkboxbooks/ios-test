module PageObjectModel
  class UserLibraryPage < PageObjectModel::Page
    trait "* marked:'Your library'"
    element :menu_button, "* id:'menuButton'"
    element :signout_button, "* marked:'Sign out'"
    def sign_out
      menu_button.touch
      signout_button.touch
    end
  end
end

module PageObjectModel
  def user_library_page
    @_user_library_page ||= page(UserLibraryPage)
  end
end
