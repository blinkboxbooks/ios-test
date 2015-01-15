module PageObjectModel
  class IncorrectEmailPasswordPopupSection < PageObjectModel::Page
    element :incorrect_email_password_popup_title, "UILabel marked:'Incorrect email or password'"
    element :send_reset_link, "UILabel marked:'Send reset link'"
    element :try_again_link, "UILabel marked:'Try again'"
  end
end