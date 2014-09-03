Feature: Existing user can logout from the app

  Background: Existing user logged into the app
    Given a valid user account ready for use on a new device
    And the anonymous library screen is displayed
    When I sign in
    Then the user library should be displayed

  Scenario: Logging out of the app
    Given the user library should be displayed
    When I press the menu button and sign out
    Then the anonymous library should be displayed
