@unstable @ILA-1371
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
      | Cancel         |

  Scenario: Verify option menu on book (not downloaded) as a signed in user on My Library tab
    Given I am signed in as a user who has downloaded books
    When I click on option menu on book not downloaded
    Then I should see the following links
      | Options        |
      | Download       |
      | About          |
      | Cancel         |

  Scenario: Verify option menu on book (not downloaded) as a signed in user on Reading tab
    Given I am signed in as a user who has downloaded books
    When I click on Reading tab
    And I click on option menu on book not downloaded
    Then I should see the following links
      | Options        |
      | Download       |
      | About          |
      | Read later     |
      | Cancel         |

  Scenario: As a guest user, verify option menu on downloaded sample book on Reading tab
    Given I open the first book on the My Library page
    And And turn 10 pages forward
    And I navigate back to My Library from the Book Reader
    When I click on Reading tab
    And I click on first embedded book options
    Then I should see the following links
      | Options         |
      | About           |
      | Content         |
      | Read            |
      | Read later      |
      | Remove          |
      | Cancel          |

  Scenario: Verify option menu on downloaded book as a signed in user on Reading tab
    Given I am signed in as a user who has downloaded books
    And I click on Reading tab
    When I download first book
    And I click on option menu on book not downloaded
    Then I should see the following links
      | Options        |
      | About          |
      | Contents       |
      | Read           |
      | Read later     |
      | Remove         |
      | Cancel         |

  Scenario: As a guest user, I can remove a book from My library
    Given I capture the current number of books in My Library
    When I choose to Remove a book from my Library
    Then the number of books in My Library should decrease by one

  Scenario: As a guest user, I can view the Table of contents of a book from My library
    Given I capture the current Books' details via the About option
    And I go back to user library screen
    When I choose "Contents" from the Options menu
    Then I should see the correct Contents shown

  Scenario: As a guest user, I can view about this book from My library
    Given I choose "Contents" from the Options menu
    When I capture book details via the Content option
    And I go back to user library screen
    And I choose "About" from the Options menu
    Then I see book details on about this book page

  Scenario: As a guest user, I want to read the book from Option menu
    Given I capture the current Books' details via the About option
    And I go back to user library screen
    When I choose "Read" from the Options menu
    And I visit the "About this book" page from the Reader option menu
    Then I see book details on about this about from reader screen

  Scenario: As a guest user, I want to read later from Option menu
    Given I open the first book on the My Library page
    And turn 3 pages forward
    And I navigate back to My Library from the Book Reader
    And I click on Reading tab
    When I capture number of books in Reading tab
    And I visit the "Read Later" page from the Reader option menu
    Then the number of books in Reading should decrease by one