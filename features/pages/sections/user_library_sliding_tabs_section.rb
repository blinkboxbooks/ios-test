module PageObjectModel
  class UserLibrarySlidingTabsSection < PageObjectModel::Page
    trait "UISegment UISegmentLabel"
    element :reading_tab, "UISegmentedControl UISegment UISegmentLabel {text BEGINSWITH 'Reading'}"
    element :my_library_tab, "UISegmentedControl UISegment UISegmentLabel {text BEGINSWITH 'My Library'}"
  end
end
