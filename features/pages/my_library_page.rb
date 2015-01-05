module PageObjectModel
  class MyLibraryPage < UserLibraryPage

    trait "UISegment label {text BEGINSWITH 'My Library'}" #need to figure out how to get the selected value
    element :info_panel_button, "UIButton marked:'icon close'"

    def dismiss_info_panel
      if info_panel_button.visible?
        until_element_does_not_exist(info_panel_button.selector, :action => lambda { info_panel_button.touch }, :retry_frequency => 1, :timeout => timeout_short)
      end
    end

  end
end

module PageObjectModel
  def my_library_page
    @_my_library_page ||= page(MyLibraryPage)
  end
end
