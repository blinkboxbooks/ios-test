module PageOperations
  include Logging

  def tap(x, y)
    touch(nil, :offset => { :x => x, :y => y })
  end
end
