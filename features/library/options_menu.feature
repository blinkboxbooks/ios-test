Feature: My Library Options Menu

  Background:
    Given the My Library screen is displayed

  @sanity
  Scenario: As a guest user, verify embedded book option menu on my library tab
    When I click on first embedded book options
    Then I should see the following links
      | Options        |
      | About          |
      | Contents       |
      | Read           |
      | Remove         |
