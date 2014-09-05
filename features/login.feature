Feature: Sign-in to blinkbox books

  Background: Existing user with an account ready for use
    Given a valid user account ready for use on a new device

  @smoke @production @reinstall
  Scenario: Existing user successfully signs in
    Given a valid user account ready for use on a new device
    And the anonymous library screen is displayed
    When I sign in
    Then the user library should be displayed
