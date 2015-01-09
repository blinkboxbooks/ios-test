Feature: Navigating the user library screen

  Background:
    Given a valid user account ready for use on a new device
    And the My Library screen is displayed

  Scenario Outline:
    When I navigate to <settings_menu_item> from the user library settings menu
    Then the <page> should be displayed

  @sanity
  Examples:
    | settings_menu_item  | page                      |
    | My library settings | sort options page         |
    | Terms & Conditions  | terms and conditions page |
    | Info                | info page                 |
    | Sign In             | sign in page              |