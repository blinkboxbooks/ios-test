Feature: Sign out from blinkbox books

  Background: Deregister devices for an existing user
    Given a valid user account ready for use on a new device

  @smoke
  Scenario: Existing user successfully signs out (after signing in)
    Given I am signed in as an existing user
    When I choose to sign out
    Then the welcome page should be displayed
