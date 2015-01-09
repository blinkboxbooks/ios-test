Feature: My Library Settings Menu

  Background:
    Given the My Library screen is displayed

  @sanity
  Scenario: As a guest user, verify the settings menu on my library tab
    When I click on the settings menu
    Then I should see the following links
      | Options             |
      | My library settings |
      | Terms & Conditions  |
      | Info                |
      | Sign In             |
      | Cancel              |

