module PageObjectModel
  class BookReaderPage < PageObjectModel::Page

    attr_accessor :footer_text, :book_chapter, :book_progress, :book_title

    trait "BBBWebView"
    element :webview_reader, "BBBWebView"
    element :add_bookmark_icon, "UIImageView marked:'icon_bookmark_add'"
    element :remove_bookmark_icon, "UIImageView marked:'icon_bookmark_delete'"
    element :back_to_last_reading_position_link, "UIButton marked:'go back'"
    element :dismiss_button, "UIButton marked:'icon cross2'"

    ###Callout PopUp
    element :copy_callout_option, "UICalloutBarButton UIButton marked:'Copy'"
    element :define_callout_option, "UICalloutBarButton UIButton marked:'Define'"
    element :highlight_callout_option, "UICalloutBarButton UIButton marked:'Highlight'"

    section :reading_option_menu, BookReaderPageOptionsMenuSection
    section :reading_header_bar, BookReaderPageHeaderSection
    section :reading_footer_bar, BookReaderPageFooterSection

    @@forward_tapping_point = {x: 90, y: 0}
    @@backward_tapping_point = {x: -90, y: 0}

    def turn_pages(number_of_pages)
      point = number_of_pages.to_i >= 0 ? @@forward_tapping_point : @@backward_tapping_point
      (number_of_pages.to_i.abs).times do
        touch("BBBWebView", :offset => {:x => point[:x], :y => point[:y]})
        sleep 1
      end
    end

    def invoke_web_reader_header_and_footer
      unless reading_header_bar.button_options.exists? and reading_footer_bar.slider.exists?
        wait_poll(until_exists: reading_header_bar.button_options.selector, timeout: timeout_short) do
          webview_reader.wait_tap(timeout: timeout_short)
          sleep 1
        end
      end
      wait_for_elements_exist(
          [
              reading_header_bar.header_bar.selector,
              reading_footer_bar.footer_bar.selector,
              reading_footer_bar.chapter_and_progress_label.selector
          ], :timeout => timeout_long)
      capture_footer_text
    end

    def close_web_reader_header_and_footer
      if reading_header_bar.button_options.exists? and reading_footer_bar.slider.exists?
        webview_reader.touch
        sleep 3
        if reading_header_bar.header_bar.visible?
          webview_reader.touch
        end
      end
      wait_for_elements_do_not_exist([reading_header_bar.header_bar.selector, reading_footer_bar.slider.selector], timeout: timeout_long)
    end

    def get_header_and_footer_text
      invoke_web_reader_header_and_footer
      capture_footer_text
    end

    def capture_footer_text
      @footer_text = reading_footer_bar.chapter_and_progress_label.text
      #@book_chapter = reading_footer_bar.chapter_label.text
      #book_progress_string = reading_footer_bar.progress_label.text
      #@book_progress = book_progress_string.slice(0..(book_progress_string.index('%')))
    end

    def move_slider_to_position(progress_percentage)
      value = progress_percentage.to_f/100
      invoke_web_reader_header_and_footer
      query(reading_footer_bar.slider.selector, [{setValue: value}, {animated: 1}])
      sleep 1
      close_web_reader_header_and_footer
    end

    def add_bookmark_via_webview_reader
      invoke_web_reader_header_and_footer
      add_bookmark_icon.wait_tap(timeout: timeout_short)
      wait_for_bookmark_to_appear
    end

    def remove_bookmark_via_webview_reader
      invoke_web_reader_header_and_footer
      remove_bookmark_icon.wait_tap(timeout: timeout_short)
      wait_for_bookmark_to_disappear
    end

    def wait_for_bookmark_to_disappear
      add_bookmark_icon.wait_for_element_exists(timeout: timeout_short)
    end

    def wait_for_bookmark_to_appear
      remove_bookmark_icon.wait_for_element_exists(timeout: timeout_short)
    end

    def back_to_last_reading_position
      back_to_last_reading_position_link.wait_tap(timeout: timeout_short)
    end

    def choose_option_from_reading_menu(option)
      invoke_web_reader_header_and_footer
      reading_header_bar.button_options.wait_tap(timeout: timeout_short)
      wait_tap("* marked:'#{option}'")
    end

    def wait_for_callout_options
      wait_for_elements_exist(
          [
              copy_callout_option.selector,
              define_callout_option.selector,
              highlight_callout_option.selector
          ], :timeout => timeout_long)
    end

    def wait_for_callout_options_not_to_exist
      wait_for_elements_do_not_exist(
          [
              copy_callout_option.selector,
              define_callout_option.selector,
              highlight_callout_option.selector
          ], :timeout => timeout_long)
    end

    def invoke_callout_popup
      webview_reader.wait_for_element_exists(timeout: timeout_short)
      sleep 2
      webview_reader.touch_hold
      wait_for_callout_options
    end

    def invoke_callout_popup_and_choose(option)
      invoke_callout_popup
      touch("* marked:'#{option}'")
      wait_for_callout_options_not_to_exist
    end

    def go_back
      reading_header_bar.back_button.touch
    end

    def choose_option_from_reading_menu(option)
      invoke_web_reader_header_and_footer
      reading_option_menu.option_menu.wait_tap(timeout: timeout_short)
      wait_tap("* marked:'#{option}'")
    end
  end
end

module PageObjectModel
  def book_reader_page
    @_book_reader_page ||= page(BookReaderPage)
  end
end
