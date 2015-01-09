module PageObjectModel
  module PageAsserts

    def expect_text(text, timeout=5)
      begin
        mark = escape_quotes(text)
        wait_for(timeout: timeout) { check_element_exists("* marked:'#{mark}'") }
        #wait_for_element_exists("UILabel marked:'#{mark}'", :timeout => timeout)
        return true
      rescue
        false
      end
    end

  end
end

World(PageObjectModel::PageAsserts)
