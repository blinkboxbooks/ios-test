@smoke
Feature: Allow the user to use the library to view free and purchased books

  Background:
    Given the My Library screen is displayed

  Scenario Outline: As an anonymous user I am able to open a book and flip through
    When I open the first book for reading
    And turn <fpages> pages forward
    And turn <bpages> pages backward
    And I navigate back to My Library from the Book Reader
    Then the my library should be displayed

  Examples:
    | fpages | bpages |
    | 5      | 3      |