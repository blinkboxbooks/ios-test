module PageObjectModel
  class SignInPage < PageObjectModel::Page
    trait "UINavigationBar marked:'Sign in'"
    element :back_button, "UINavigationItemButtonView marked:'Back'"
    element :sign_in_button, "UIButton marked:'Sign in'"
    element :email_address_field, "UITextField placeholder:'email address'"
    element :password_field, "UITextField placeholder:'password'"
    element :show_password_switch, "UISwitch"
    element :forgotten_password_link, "UIButton marked:'Forgotten your password?'"

    section :signin_incorrect_email_password_popup, IncorrectEmailPasswordPopupSection

    def submit_sign_in_details(username, password)
      email_address_field.touch
      wait_for_keyboard
      #password_field.set password
      keyboard_enter_text username
      dismiss_username_suggestions_popup
      password_field.wait_tap(timeout: timeout_short)
      keyboard_enter_text password
      sign_in_button.touch
    end

    def dismiss_username_suggestions_popup
      if element_exists("WEPopoverContainerView")
        touch(nil, :offset => {:x => 100, :y => 100})
      end
    end

    def click_on_reset_password_link
      forgotten_password_link.wait_for_element_exists
      forgotten_password_link.touch
    end

    def has_incorrect_credentials_popup?
      assert_popup([
                       signin_incorrect_email_password_popup.incorrect_email_password_popup_title.selector,
                       signin_incorrect_email_password_popup.send_reset_link.selector,
                       signin_incorrect_email_password_popup.try_again_link.selector
                   ])
    end
  end
end

module PageObjectModel
  def sign_in_page
    @_sign_in_page ||= page(SignInPage)
  end
end
