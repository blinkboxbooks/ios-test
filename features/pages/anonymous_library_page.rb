module PageObjectModel
  class AnonymousLibraryPage < PageObjectModel::Page
    trait "* marked:'Sign in'"
    element :sign_in_button, "* marked:'Sign in'"
    def logged_out?
      sign_in_button.exists?
    end
    def signin
      sign_in_button.touch
    end
  end
end

module PageObjectModel
  def anonymous_library_page
    @_anonymous_library_page ||= page(AnonymousLibraryPage)
  end
end
