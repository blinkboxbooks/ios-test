module PageObjectModel
  class BookReaderPageHeaderSection < PageObjectModel::Page
    element :header_bar, "UINavigationBar"
    element :back_button, "* marked:'Back'"
    element :book_title, "UINavigationBar UILabel index:1"
    element :button_options, "UINavigationBar UIButton marked:'Options'"
    element :add_bookmark_button, "UIButton marked:'icon bookmark add'" #"UIImageView marked:'icon_bookmark_add'"
    element :remove_bookmark_button, "UIImageView marked:'icon_bookmark_delete'" #ILA-1342: request for improved IDs
  end
end
