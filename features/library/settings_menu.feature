Feature: My Library Settings Menu

  @sanity
  Scenario: As a guest user, verify the settings menu on my library tab
    Given the My Library screen is displayed
    When I click on the settings menu
    Then I should see the following links
      | Options             |
      | My library settings |
      | Terms & Conditions  |
      | Info                |
      | Sign In             |
      | Cancel              |

  @sanity
  Scenario: As a signed in user, verify the settings menu on my library tab
    Given I am signed in as an existing user
    When I click on the settings menu
    Then I should see the following links
      | Options             |
      | My library settings |
      | Terms & Conditions  |
      | Info                |
      | Sign Out            |
      | Cancel              |
