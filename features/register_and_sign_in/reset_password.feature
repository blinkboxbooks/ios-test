Feature: Reset password
  As a blinkbox books app user
  I want to reset my forgotten password
  So that I can sign into blinkbox books again

  Background:
    Given the My Library screen is displayed
    And I navigate to the Sign in page
    When I tap on Forgotten your password link
    Then reset password popup is displayed

  Scenario: Reset password with valid email address
    Given I enter an email address registered with blinkbox books
    And I tap on reset password button
    Then I can see password reset email sent confirmation popup
    And I can close the pop up

  Scenario: Reset password with valid email address but not registered with blinkbox books
    Given I enter an email address not registered with blinkbox books
    And I tap on reset password button
    Then I can see password reset email sent confirmation popup
    And I can close the pop up

  Scenario: Reset password leaving email address blank
    Given I tap on reset password button without entering email address
    Then I should see the enter email address pop up
    And I can close the pop up

  Scenario Outline: Reset password with invalid email address
    When I enter <invalid_email> email address
    And I tap on reset password button
    Then I should see the enter a valid email address pop up
    And I can close the pop up

  Examples:
    | invalid_email        |
    | no_thanks@to_you     |
    | 2233@blah            |
    | testblinknow         |


