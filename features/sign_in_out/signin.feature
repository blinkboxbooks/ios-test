Feature: Sign in into blinkbox books

  Background: Deregister devices for an existing user
    Given a valid user account ready for use on a new device

  @sanity
  Scenario: Existing user successfully signs in via the User Library page
    Given the My Library screen is displayed
    When I navigate to the Sign in page
    And I submit valid sign in details
    Then the my library page should be displayed
    And I should see the "Sign Out" option in the settings menu

  Scenario: Existing user successfully signs in via the Welcome page
    Given the Welcome screen is displayed
    When I sign in
    Then the my library page should be displayed
    And I should see the "Sign Out" option in the settings menu

  @production
  Scenario Outline: Sign in with invalid email or password
    Given the My Library screen is displayed
    When I navigate to the Sign in page
    And I try to sign in with an <invalid_credentials>
    Then sign in is not successful
    And I see the incorrect email address and password error message popup with send reset link

  @smoke-all
  Examples:
    | invalid_credentials        |
    | unregistered email address |

  Examples:
    | invalid_credentials        |
    | incorrect password         |
