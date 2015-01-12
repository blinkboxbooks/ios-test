@sanity
Feature: Highlights
  I am able to highlight some text so that I can annotate

  Background:
    Given the My Library screen is displayed
    When I open the first book on the My Library page
    And turn 20 pages forward

  Scenario: I can highlight some text
    When I invoke the Highlight functionality on the reader
    Then I can see that the text has been highlighted
