module PageObjectModel
  class SignInPage < PageObjectModel::Page
    trait "* marked:'Show password while typing'"
    element :sign_in_button, "* marked:'Sign in'"
    element :email_address_field, "* marked:'email address'"
    element :password_field, "* marked:'password'"

    def submit_sign_in_details(username, password)
      email_address_field.touch
      wait_for_keyboard
      keyboard_enter_text username
      password_field.touch
      keyboard_enter_text password
      sign_in_button.touch
    end
  end
end

module PageObjectModel
  def sign_in_page
    @_sign_in_page ||= page(SignInPage)
  end
end
