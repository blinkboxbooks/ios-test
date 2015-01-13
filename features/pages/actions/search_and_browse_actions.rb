module PageModels
  module SearchAndBrowseActions

    def search_from_user_library_page
      user_library_page.invoke_search
      expect_page(search_page)
    end

  end
end

World(PageModels::SearchAndBrowseActions)
