module PageObjectModel
  class WelcomePage < PageObjectModel::Page
    trait "UIButton marked:'Try it out'"
    element :try_it_out_button, "UIButton marked:'Try it out'"
    element :sign_up_button, "UIButton marked:'Sign in'"

    def try_it_out
      try_it_out_button.touch
    end

    def sign_up
      sign_up_button.touch
    end
  end
end

module PageObjectModel
  def welcome_page
    @_welcome_page ||= page(WelcomePage)
  end
end
