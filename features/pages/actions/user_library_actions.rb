module PageObjectModel
  module UserLibraryActions

    def open_settings_menu
      user_library_page.open_settings
    end

    def expect_option_in_settings_menu(option)
      open_settings_menu
      expect_text(option)
    end

    def open_settings_menu_and_choose(option)
      expect_option_in_settings_menu(option)
      tap_mark(option)
    end

    def get_first_book_details_from_about_page
      user_library_page.choose_from_options_menu("About")
      expect_page(about_this_book_page)
      @book_author = about_this_book_page.book_author.text
      @book_title = about_this_book_page.book_title.text
      return @book_author,@book_title
    end

    def goto_user_library_tab(user_option)
      case user_option
        when "Reading"
          user_library_page.goto_reading_tab
        when "My Library"
          user_library_page.goto_my_library_tab
        else
          fail "Unsupported button '#{negate}' in the User library area"
      end
    end

    def open_first_book_in_user_library(library_section)
      goto_user_library_tab(library_section)
      user_library_page.open_first_book
      expect_page(book_reader_page)
      #wait_for_book_reader_page
    end

    #  def read_first_book
    #    user_library_page.from_options_menu_choose("Read")
    #    wait_for_book_reader_page
    #  end

  end
end

World(PageObjectModel::UserLibraryActions)
