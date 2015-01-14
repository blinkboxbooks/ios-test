module PageOperations
  include Logging

  def tap(x, y)
    touch(nil, :offset => { :x => x, :y => y })
  end

  def assert_popup(elements_array)
    begin
      wait_for_elements_exist(elements_array, timeout: 5)
      return true
    rescue
      false
    end
  end

  alias_method :assert_section, :assert_popup

end
