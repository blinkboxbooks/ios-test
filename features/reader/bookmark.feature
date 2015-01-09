Feature: Bookmarking
  As a reader I am able to add and remove bookmarks

  Background:
    Given the My Library screen is displayed
    When I open the first book on the My Library page
    And turn 15 pages forward
    #And I set the book slider position to 10

  @sanity
  Scenario: I am able to add/remove a bookmark using the Book Reader page
   Given I choose to add a bookmark using the Book Reader page
   Then I choose to remove a bookmark using the Book Reader page

