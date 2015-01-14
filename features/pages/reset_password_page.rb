module PageObjectModel
  class ResetPasswordPage < PageObjectModel::Page
    trait "UILabel marked:'Forgotten Password'"
    element :reset_email_address_field, "UITextFieldLabel marked:'email address'"
    element :reset_password_button, "UIButton marked:'Reset password'"
    element :ok_button_from_popup, "UILabel marked:'OK'"

    def has_we_sent_you_an_email_popup?
      assert_popup([
                       "UILabel marked:'We\\'ve sent you an email'",
                       ok_button_from_popup.selector
                   ])
    end

    def has_enter_your_email_address_popup?
      assert_popup([
                       "UILabel marked:'Email address'",
                       "UILabel marked:'Please enter an email address'",
                       ok_button_from_popup.selector
                   ])
    end

    def has_enter_your_valid_email_address_popup?
      assert_popup([
                       "UILabel marked:'Email address'",
                       "UILabel marked:'Please enter a valid email address'",
                       ok_button_from_popup.selector
                   ])
    end

    def enter_email_address(email_address)
      reset_email_address_field.touch
      wait_for_keyboard
      keyboard_enter_text email_address
    end

    def click_on_reset_password_button
      reset_password_button.touch
    end

    def click_on_ok_to_close_popup
      ok_button_from_popup.touch
    end
  end
end

module PageObjectModel
  def reset_password_page
    @_reset_password_page||= page(ResetPasswordPage)
  end
end