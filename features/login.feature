Feature: Sign-in to blinkbox books

  Background: Existing user with an account ready for use
    Given a valid user account ready for use on a new device

  @smoke @production @reinstall
  Scenario: Existing user successfully signs in
    Given the anonymous library screen is displayed
    And I touch "Sign in"
    When I enter "acceptancetestingbbb@gmail.com" into input field number 1
    And I enter "9e6fdf08-2556-4e9e-b30a-20d97b0e3d19" into input field number 2
    And I touch "Sign in"
    Then the user library should be displayed
