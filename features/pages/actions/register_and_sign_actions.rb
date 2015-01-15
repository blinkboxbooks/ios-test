module PageModels
  module RegisterAndSigninActions
    def enter_app_as_anonymous_user
      welcome_page.try_it_out if welcome_page.displayed?
      dismiss_info_panel
    end

    def dismiss_info_panel
      my_library_page.dismiss_info_panel
    end

    def navigate_to_signin_page
      my_library_page.open_settings_and_sign_in
      sign_in_page.await
    end

    def enter_app_as_existing_user
      enter_app_as(test_data['users']['existing']['emailaddress'], test_data['users']['existing']['password'])
      #dismiss_info_panel
      expect_page(my_library_page)
    end

    def enter_app_as(username, password)
      if welcome_page.displayed?
        welcome_page.sign_up
      elsif my_library_page.displayed?
        open_settings_menu_and_choose("Sign In")
      end
      sign_in_page.await
      sign_in_page.submit_sign_in_details(username, password)
    end

  end
end

World(PageModels::RegisterAndSigninActions)
