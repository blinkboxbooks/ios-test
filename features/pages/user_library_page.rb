module PageObjectModel
  class UserLibraryPage < PageObjectModel::Page
    trait "UIImageView marked:’blink box_nav_logo'"
    element :info_panel_button, "UIButton marked:'icon close'"

    #books list
    element :first_book_options, "UIButton marked:'Options' index:0"
    #element :first_book_cover, "UIBookCollectionViewCell"

    section :common_top_nav, CommonTopNavSection
    section :common_settings_menu, CommonSettingsMenuSection

    def dismiss_info_panel
      if info_panel_button.visible?
        until_element_does_not_exist(info_panel_button.selector, :action => lambda { info_panel_button.touch }, :retry_frequency => 1, :timeout => timeout_short)
      end
    end

    def open_first_book_options
      first_book_options.wait_tap(timeout: timeout_short)
    end

    def choose_from_options_menu(option)
      open_first_book_options
      sleep 1
      touch("UILabel marked:'#{option}'")
    end

    def open_settings_and_sign_in
      open_settings
      common_settings_menu.sign_in.wait_tap(timeout: timeout_short)
    end

    def open_settings
      common_settings_menu.settings_button.wait_tap(timeout: timeout_short)
      sleep 1 #its a bit too quick and tries to press the button too quick if you use wait_tap
    end

    def invoke_search
      common_top_nav.search_button.touch
    end

    def open_first_book
      first_book_options.wait_for_element_exists(timeout: timeout_short)
      touch(first_book_options.selector, :offset => {:x => 0, :y => -50})
    end

  end
end

module PageObjectModel
  def user_library_page
    @_user_library_page ||= page(UserLibraryPage)
  end
end
