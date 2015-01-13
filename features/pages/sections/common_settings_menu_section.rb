module PageObjectModel
  class CommonSettingsMenuSection < PageObjectModel::Page
    element :settings_button, "UINavigationButton marked:'Settings'"
    ###settings options...
    element :my_library_settings, "UILabel marked:'My library settings'"
    element :terms_and_cond, "UILabel marked:'Terms & Conditions'"
    element :info, "UILabel marked:'Info'"
    element :sign_in, "UILabel marked:'Sign In'"
    element :debug, "UILabel marked:'Debug'"
    element :cancel, "UILabel marked:'Cancel'"
  end
end
