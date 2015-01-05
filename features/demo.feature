#@unstable @production @demo testing deliberate failure
@smoke
Feature: I want to demonstrate what an automation framework looks like in operation

  Background:
    Given the My Library screen is displayed

  Scenario Outline: Navigating through the app on the device
    When I enter <query> as the search term
    Then I should see search suggestions
    And I press "DONEQW"
    When I open the first book
    And turn <fpages> pages forward
    And turn <bpages> pages backward
    And I navigate back until I get to the My Library page

  Examples:
    | query  | fpages | bpages |
    | Robots | 10     | 10     |
