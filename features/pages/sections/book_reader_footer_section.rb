module PageObjectModel
  class BookReaderPageFooterSection < PageObjectModel::Page
    element :footer_bar, "BBBReaderBottomBar"
    element :chapter_and_progress_label, "BBBReaderBottomBar UILabel"
    element :slider, "UISlider"
  end
end
