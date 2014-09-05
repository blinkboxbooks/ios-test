module PageObjectModel
  class WelcomePage < PageObjectModel::Page
    trait "* marked:'Sign in or Register'"
    element :try_it_out_button, "* marked:'Try it out'"
    def goto_library
      try_it_out_button.touch
    end
  end
end

module PageObjectModel
  def welcome_page
    @_welcome_page ||= page(WelcomePage)
  end
end
