module PageObjectModel
  module PageAsserts

    def expect_text(text, timeout=5)
      begin
        mark = escape_quotes(text)
        wait_for(timeout: timeout) { element_exists("* marked:'#{mark}'") }
        return true
      rescue
        false
      end
    end

  end
end


World(PageObjectModel::PageAsserts)
