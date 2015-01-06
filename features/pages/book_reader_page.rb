module PageObjectModel
  class BookReaderPage < PageObjectModel::Page

    attr_accessor :footer_text#:book_chapter, :book_progress, :book_title
    trait "BBBWebView"
    element :webview_reader, "BBBWebView"

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
          ],:timeout => timeout_long)
      capture_footer_text
    end

    def capture_footer_text
      @footer_text = reading_footer_bar.chapter_and_progress_label.text
      #@book_chapter = reading_footer_bar.chapter_label.text
      #book_progress_string = reading_footer_bar.progress_label.text
      #@book_progress = book_progress_string.slice(0..(book_progress_string.index('%')))
    end
end

end

module PageObjectModel
  def book_reader_page
    @_book_reader_page ||= page(BookReaderPage)
  end
end
